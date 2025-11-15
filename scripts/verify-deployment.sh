#!/bin/bash
# ORISO-Kubernetes Deployment Verification Script
# Verifies that all components are deployed and healthy

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

NAMESPACE="caritas"

echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}   ORISO Platform - Deployment Verification${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo ""

# Function to check service health
check_health() {
    local name=$1
    local url=$2
    
    if curl -s -f "$url" > /dev/null 2>&1; then
        echo -e "${GREEN}✓${NC} $name is healthy"
        return 0
    else
        echo -e "${RED}✗${NC} $name is not responding"
        return 1
    fi
}

# Check cluster connection
echo -e "${YELLOW}Checking Kubernetes cluster...${NC}"
if kubectl cluster-info &> /dev/null; then
    echo -e "${GREEN}✓${NC} Connected to Kubernetes cluster"
else
    echo -e "${RED}✗${NC} Cannot connect to Kubernetes cluster"
    exit 1
fi

# Check namespace
if kubectl get namespace "$NAMESPACE" &> /dev/null; then
    echo -e "${GREEN}✓${NC} Namespace '$NAMESPACE' exists"
else
    echo -e "${RED}✗${NC} Namespace '$NAMESPACE' not found"
    exit 1
fi

echo ""
echo -e "${YELLOW}Checking Pod Status...${NC}"
echo ""

# Get pod status
kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | while read -r line; do
    POD_NAME=$(echo "$line" | awk '{print $1}')
    STATUS=$(echo "$line" | awk '{print $3}')
    READY=$(echo "$line" | awk '{print $2}')
    
    if [[ "$STATUS" == "Running" ]] && [[ "$READY" =~ ^1/1 ]]; then
        echo -e "${GREEN}✓${NC} $POD_NAME - $STATUS ($READY)"
    elif [[ "$STATUS" == "Running" ]]; then
        echo -e "${YELLOW}⚠${NC} $POD_NAME - $STATUS ($READY) - Not ready"
    else
        echo -e "${RED}✗${NC} $POD_NAME - $STATUS ($READY)"
    fi
done

# Summary counts
echo ""
echo -e "${YELLOW}Pod Summary:${NC}"
TOTAL=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | wc -l)
RUNNING=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep -c "Running" || echo "0")
PENDING=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep -c "Pending" || echo "0")
FAILED=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | grep -c "Error\|CrashLoopBackOff" || echo "0")

echo "Total Pods: $TOTAL"
echo -e "Running: ${GREEN}$RUNNING${NC}"
if [ "$PENDING" -gt 0 ]; then
    echo -e "Pending: ${YELLOW}$PENDING${NC}"
fi
if [ "$FAILED" -gt 0 ]; then
    echo -e "Failed: ${RED}$FAILED${NC}"
fi

echo ""
echo -e "${YELLOW}Checking Service Health Endpoints...${NC}"
echo ""

# Health checks for backend services
check_health "TenantService" "http://127.0.0.1:8081/actuator/health"
check_health "UserService" "http://127.0.0.1:8082/actuator/health"
check_health "ConsultingTypeService" "http://127.0.0.1:8083/actuator/health"
check_health "AgencyService" "http://127.0.0.1:8084/actuator/health"

echo ""
echo -e "${YELLOW}Checking Web Interfaces...${NC}"
echo ""

# Get server IP
SERVER_IP=$(hostname -I | awk '{print $1}')

# Check web interfaces (just checking if port is open)
check_port() {
    local name=$1
    local port=$2
    if timeout 2 bash -c "echo >/dev/tcp/127.0.0.1/$port" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} $name (port $port) is accessible"
        return 0
    else
        echo -e "${RED}✗${NC} $name (port $port) is not accessible"
        return 1
    fi
}

check_port "Frontend" 9001
check_port "Admin" 9002
check_port "Keycloak" 8089
check_port "Redis Commander" 9021

echo ""
echo -e "${YELLOW}Checking Services (Kubernetes)...${NC}"
echo ""

# Check if services exist
SERVICES=("tenantservice" "userservice" "consultingtypeservice" "agencyservice" "frontend" "admin" "keycloak" "redis" "mariadb" "mongodb" "cob-proxy")

for svc in "${SERVICES[@]}"; do
    if kubectl get svc "$svc" -n "$NAMESPACE" &> /dev/null; then
        CLUSTER_IP=$(kubectl get svc "$svc" -n "$NAMESPACE" -o jsonpath='{.spec.clusterIP}')
        echo -e "${GREEN}✓${NC} Service: $svc (ClusterIP: $CLUSTER_IP)"
    else
        echo -e "${RED}✗${NC} Service: $svc not found"
    fi
done

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}   Access URLs${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "Frontend:          ${BLUE}http://$SERVER_IP:9001${NC}"
echo -e "Admin:             ${BLUE}http://$SERVER_IP:9002${NC}"
echo -e "Keycloak Admin:    ${BLUE}http://$SERVER_IP:8089/auth/admin/${NC}"
echo -e "                   (Login: admin/admin)"
echo -e "Redis Commander:   ${BLUE}http://$SERVER_IP:9021${NC}"
echo -e "Health Dashboard:  ${BLUE}http://$SERVER_IP:9100${NC}"
echo -e "Matrix Element:    ${BLUE}http://$SERVER_IP:8087${NC}"
echo ""

echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}   Verification Complete${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════${NC}"
echo ""

if [ "$FAILED" -gt 0 ]; then
    echo -e "${RED}Some pods are failing. Check logs:${NC}"
    echo "  kubectl logs <pod-name> -n $NAMESPACE"
    echo "  kubectl describe pod <pod-name> -n $NAMESPACE"
    exit 1
elif [ "$PENDING" -gt 0 ]; then
    echo -e "${YELLOW}Some pods are still pending. Give them more time or check:${NC}"
    echo "  kubectl describe pod <pod-name> -n $NAMESPACE"
    exit 0
else
    echo -e "${GREEN}All pods are running successfully!${NC}"
    exit 0
fi

