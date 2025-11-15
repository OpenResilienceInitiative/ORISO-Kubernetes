#!/bin/bash
# ORISO-Kubernetes Master Deployment Script
# Deploys the complete ORISO platform in the correct order

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
NAMESPACE="caritas"
DEPLOYMENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/deployments"
SERVICE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/services"
CONFIGMAP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/configmaps"

echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}   ORISO Platform - Master Kubernetes Deployment${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}Starting deployment at: $(date)${NC}"
echo ""

# Function to print section header
print_section() {
    echo ""
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}  $1${NC}"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# Function to print success
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Function to print error
print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Function to print warning
print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# Function to wait for pods
wait_for_pods() {
    local label=$1
    local timeout=${2:-300}
    echo "Waiting for pods with label $label to be ready (timeout: ${timeout}s)..."
    if kubectl wait --for=condition=ready pod -l "$label" -n "$NAMESPACE" --timeout="${timeout}s" 2>/dev/null; then
        print_success "Pods ready: $label"
        return 0
    else
        print_warning "Timeout waiting for pods: $label (continuing anyway)"
        return 1
    fi
}

# Check prerequisites
print_section "Checking Prerequisites"

if ! command -v kubectl &> /dev/null; then
    print_error "kubectl not found. Please install kubectl first."
    exit 1
fi
print_success "kubectl is installed"

if ! kubectl cluster-info &> /dev/null; then
    print_error "Cannot connect to Kubernetes cluster"
    exit 1
fi
print_success "Connected to Kubernetes cluster"

# Create namespace if it doesn't exist
print_section "Creating Namespace"
if kubectl get namespace "$NAMESPACE" &> /dev/null; then
    print_success "Namespace '$NAMESPACE' already exists"
else
    kubectl create namespace "$NAMESPACE"
    print_success "Created namespace '$NAMESPACE'"
fi

# Phase 1: Infrastructure
print_section "Phase 1: Infrastructure (Databases & Message Queue)"
echo "Deploying: MariaDB, MongoDB, RabbitMQ"

if kubectl apply -f "$DEPLOYMENT_DIR/01-infrastructure.yaml"; then
    print_success "Infrastructure deployments applied"
else
    print_error "Failed to apply infrastructure deployments"
    exit 1
fi

print_success "Waiting for infrastructure to be ready..."
sleep 10
wait_for_pods "app=mariadb" 300
wait_for_pods "app=mongodb" 300
wait_for_pods "app=rabbitmq" 300

#  Phase 2: Redis Stack
print_section "Phase 2: Redis Stack (Cache & GUI)"
echo "Deploying: Redis, Redis Commander, Redis Exporter"

if kubectl apply -f "$DEPLOYMENT_DIR/02-redis-stack.yaml"; then
    print_success "Redis stack deployments applied"
else
    print_error "Failed to apply Redis stack"
    exit 1
fi

print_success "Waiting for Redis to be ready..."
sleep 5
wait_for_pods "app=redis" 180

# Phase 3: Keycloak
print_section "Phase 3: Keycloak (Authentication)"
echo "Deploying: Keycloak"

if kubectl apply -f "$DEPLOYMENT_DIR/03-keycloak.yaml"; then
    print_success "Keycloak deployment applied"
else
    print_error "Failed to apply Keycloak"
    exit 1
fi

print_success "Waiting for Keycloak to be ready..."
sleep 10
wait_for_pods "app=keycloak" 300

# Phase 3.5: Configure Keycloak for HTTP Access
print_section "Phase 3.5: Keycloak Configuration (CRITICAL)"
print_warning "IMPORTANT: Keycloak needs HTTP access configuration"
echo ""
echo "After deployment completes, you MUST run:"
echo ""
echo -e "${BLUE}cd /path/to/ORISO-Keycloak${NC}"
echo -e "${BLUE}./configure-http-access.sh${NC}"
echo ""
echo "This disables SSL requirement for HTTP access."
echo "Press Enter to continue..."
read -r

# Phase 4: Backend Services
print_section "Phase 4: Backend Services (Core Services)"
echo "Deploying: TenantService, UserService, ConsultingTypeService,"
echo "           AgencyService, UploadService, VideoService"

if kubectl apply -f "$DEPLOYMENT_DIR/04-backend-services.yaml"; then
    print_success "Backend services deployments applied"
else
    print_error "Failed to apply backend services"
    exit 1
fi

print_success "Waiting for backend services to be ready..."
sleep 15
wait_for_pods "tier=backend" 600

# Phase 5: Frontend
print_section "Phase 5: Frontend Applications"
echo "Deploying: Frontend, Admin"

if kubectl apply -f "$DEPLOYMENT_DIR/05-frontend.yaml"; then
    print_success "Frontend deployments applied"
else
    print_error "Failed to apply frontend"
    exit 1
fi

print_success "Waiting for frontend to be ready..."
sleep 10
wait_for_pods "tier=frontend" 300

# Phase 6: Communication (Matrix)
print_section "Phase 6: Communication Platform (Matrix)"
echo "Deploying: Matrix Synapse, Element.io"

if kubectl apply -f "$DEPLOYMENT_DIR/06-matrix.yaml"; then
    print_success "Matrix deployments applied"
else
    print_error "Failed to apply Matrix"
    exit 1
fi

print_success "Waiting for Matrix to be ready..."
sleep 10
wait_for_pods "app=matrix-synapse" 300

# Phase 7: Nginx Proxy
print_section "Phase 7: Reverse Proxy (Nginx)"
echo "Deploying: cob-proxy"

# Apply ConfigMap first
if [ -f "$CONFIGMAP_DIR/nginx-config.yaml" ]; then
    kubectl apply -f "$CONFIGMAP_DIR/nginx-config.yaml"
    print_success "Nginx ConfigMap applied"
fi

if kubectl apply -f "$DEPLOYMENT_DIR/08-nginx-proxy.yaml"; then
    print_success "Nginx proxy deployment applied"
else
    print_error "Failed to apply Nginx proxy"
    exit 1
fi

print_success "Waiting for Nginx proxy to be ready..."
sleep 5
wait_for_pods "app=cob-proxy" 180

# Phase 8: Monitoring (Optional)
print_section "Phase 8: Monitoring (Optional)"
echo "Do you want to deploy monitoring (Health Dashboard, SignOZ)? (y/N)"
read -r deploy_monitoring

if [[ $deploy_monitoring =~ ^[Yy]$ ]]; then
    if kubectl apply -f "$DEPLOYMENT_DIR/10-monitoring.yaml"; then
        print_success "Monitoring deployments applied"
    else
        print_warning "Failed to apply monitoring (non-critical)"
    fi
    
    # SignOZ requires Helm
    echo "For SignOZ deployment, please see ORISO-SignOZ repository"
else
    print_warning "Skipping monitoring deployment"
fi

# Apply all services
print_section "Applying Services"
if kubectl apply -f "$SERVICE_DIR/all-services.yaml"; then
    print_success "All services applied"
else
    print_warning "Some services may have failed (check manually)"
fi

# Final Summary
print_section "Deployment Summary"

echo ""
echo "Checking deployment status..."
echo ""

# Count pods by status
RUNNING=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep -c "Running" || echo "0")
PENDING=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep -c "Pending" || echo "0")
FAILED=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep -c "Error\|CrashLoopBackOff" || echo "0")
TOTAL=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | wc -l || echo "0")

echo -e "${GREEN}Running Pods:${NC} $RUNNING / $TOTAL"
if [ "$PENDING" -gt 0 ]; then
    echo -e "${YELLOW}Pending Pods:${NC} $PENDING"
fi
if [ "$FAILED" -gt 0 ]; then
    echo -e "${RED}Failed Pods:${NC} $FAILED"
fi

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}   Deployment Complete!${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo ""

# Get server IP
SERVER_IP=$(hostname -I | awk '{print $1}')

echo -e "${YELLOW}Important Next Steps:${NC}"
echo ""
echo "1. Configure Keycloak for HTTP access:"
echo -e "   ${BLUE}cd /path/to/ORISO-Keycloak${NC}"
echo -e "   ${BLUE}./configure-http-access.sh${NC}"
echo ""
echo "2. Import Keycloak realm:"
echo -e "   Access: ${BLUE}http://$SERVER_IP:8089/auth/admin/${NC}"
echo "   Login: admin/admin"
echo "   Import: ORISO-Keycloak/realm.json"
echo ""
echo "3. Setup databases (if fresh installation):"
echo -e "   ${BLUE}cd /path/to/ORISO-Database${NC}"
echo -e "   ${BLUE}./scripts/setup/00-master-setup.sh${NC}"
echo ""
echo "4. Verify deployment:"
echo -e "   ${BLUE}./scripts/verify-deployment.sh${NC}"
echo ""

echo -e "${YELLOW}Access URLs:${NC}"
echo -e "  Frontend:          ${BLUE}http://$SERVER_IP:9001${NC}"
echo -e "  Admin:             ${BLUE}http://$SERVER_IP:9002${NC}"
echo -e "  Keycloak Admin:    ${BLUE}http://$SERVER_IP:8089/auth/admin/${NC}"
echo -e "  Redis Commander:   ${BLUE}http://$SERVER_IP:9021${NC}"
echo -e "  Health Dashboard:  ${BLUE}http://$SERVER_IP:9100${NC}"
echo -e "  Matrix Element:    ${BLUE}http://$SERVER_IP:8087${NC}"
echo ""

echo -e "${GREEN}Deployment completed at: $(date)${NC}"
echo ""
echo "For troubleshooting, run:"
echo -e "  ${BLUE}kubectl get pods -n $NAMESPACE${NC}"
echo -e "  ${BLUE}kubectl logs <pod-name> -n $NAMESPACE${NC}"
echo ""

