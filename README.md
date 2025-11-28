# ORISO Kubernetes Deployment

**Complete Kubernetes deployment configuration for ORISO Platform**

**Version**: 3.0.0  
**Last Updated**: November 28, 2025  
**Status**: Production Ready

---

## 📋 Overview

This repository contains all Kubernetes deployment configurations for the ORISO (Online Beratung) platform, including:

- Infrastructure (MariaDB, MongoDB, RabbitMQ)
- Redis Stack (Redis, Commander, Exporter)
- Authentication (Keycloak)
- Backend Services (Tenant, User, Agency, ConsultingType, Upload, Video)
- Frontend & Admin Panel
- Communication (Matrix Synapse, Element.io)
- API Gateway (Nginx)
- Monitoring & Health Dashboard

---

## 🚀 Quick Start

### Prerequisites

```bash
# Kubernetes cluster (k3s recommended)
kubectl version --client

# Docker (for building images)
docker --version

# Access to cluster
kubectl get nodes
```

### Deploy Everything

```bash
# Clone repository
cd ~/workspace/ORISO-Kubernetes
# Or use your preferred workspace location

# Run automated deployment
./scripts/deploy-all.sh

# Or manual step-by-step deployment (see below)
```

---

## 📁 Repository Structure

```
ORISO-Kubernetes/
├── deployments/           # Kubernetes deployment YAMLs
│   ├── 01-infrastructure.yaml              # MariaDB, MongoDB, RabbitMQ (with PVCs)
│   ├── 02-redis-stack.yaml                 # Redis, Commander, Exporter
│   ├── 03-keycloak.yaml                    # Keycloak authentication
│   ├── 04-backend-services.yaml            # Backend services (Production - Docker images)
│   ├── 05-frontend.yaml                    # Frontend & Admin (Production - Docker images)
│   ├── 06-matrix.yaml                      # Matrix Synapse & Element
│   ├── 08-nginx-proxy.yaml                 # Nginx API Gateway
│   ├── 10-monitoring.yaml                  # Health Dashboard
│   └── 11-mariadb-statefulset.yaml         # MariaDB StatefulSet (with PVCs)
├── services/              # Kubernetes service definitions
│   └── all-services.yaml                   # All service definitions
├── configmaps/            # Configuration files
│   ├── nginx-config.yaml                   # Nginx configuration
│   └── services/                           # Service-specific ConfigMaps
├── secrets/               # Secret definitions
│   └── services/                           # Service-specific Secrets
├── scripts/               # Deployment automation
│   ├── deploy-all.sh                       # Master deployment script
│   ├── verify-deployment.sh                # Deployment verification
│   ├── apply-configmaps-secrets.sh         # Apply ConfigMaps and Secrets
│   └── configure-keycloak-http.sh          # Keycloak HTTP configuration
├── maven-cache-pvc.yaml   # Maven cache PVC (optional)
├── README.md              # This file
├── QUICK_START.md         # Quick start guide for new users
├── DEPLOYMENT.md          # Detailed deployment guide
├── BUILD_GUIDE.md         # Build and image creation guide
└── STATUS.md              # Current deployment status
```

---

## 🔧 Production Deployment

**Characteristics:**
- All services use pre-built Docker images (`oriso-*`)
- No hostPath dependencies - uses PVCs for persistent storage
- Portable across any Kubernetes cluster
- Databases use StatefulSets/Deployments with PVCs
- ConfigMaps and Secrets for configuration
- Fast startup times
- Production-ready resource limits

**Image Naming Convention:**
- Backend services: `oriso-{servicename}:latest` (e.g., `oriso-tenantservice:latest`)
- Frontend: `oriso-frontend:latest`
- Admin: `oriso-admin:latest`

**Prerequisites:**
1. Build Docker images from ORISO-* repositories (see BUILD_GUIDE.md)
2. Import images to k3s: `docker save <image> | sudo k3s ctr images import -`
3. Apply ConfigMaps and Secrets before deploying services

---

## 📦 Deployment Steps

### Option A: Automated Deployment (Recommended)

```bash
cd ~/workspace/ORISO-Kubernetes

# Run master deployment script
./scripts/deploy-all.sh

# Follow prompts and wait for completion
# Estimated time: 20-35 minutes
```

### Option B: Manual Step-by-Step Deployment

#### 1. Create Namespace

```bash
kubectl create namespace caritas
```

#### 2. Deploy Infrastructure

```bash
kubectl apply -f deployments/01-infrastructure.yaml
```

Wait for pods to be ready:
```bash
kubectl wait --for=condition=ready pod -l app=mariadb -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=mongodb -n caritas --timeout=300s
```

#### 3. Deploy Redis Stack

```bash
kubectl apply -f deployments/02-redis-stack.yaml
kubectl wait --for=condition=ready pod -l app=redis -n caritas --timeout=180s
```

#### 4. Deploy Keycloak

```bash
kubectl apply -f deployments/03-keycloak.yaml
kubectl wait --for=condition=ready pod -l app=keycloak -n caritas --timeout=600s
```

#### 5. Initialize Databases

```bash
cd ../ORISO-Database
./scripts/setup/00-master-setup.sh
cd ../ORISO-Kubernetes
```

#### 6. Apply ConfigMaps and Secrets

```bash
# Apply service ConfigMaps
kubectl apply -f configmaps/services/

# Apply service Secrets
kubectl apply -f secrets/services/
```

#### 7. Deploy Backend Services

```bash
# First, build all Docker images (see BUILD_GUIDE.md)
# Then import to k3s: docker save <image> | sudo k3s ctr images import -
kubectl apply -f deployments/04-backend-services.yaml
```

#### 8. Deploy Frontend

```bash
# First, build Docker images (see BUILD_GUIDE.md)
# Then import to k3s: docker save <image> | sudo k3s ctr images import -
kubectl apply -f deployments/05-frontend.yaml
```

#### 9. Deploy Matrix Communication

```bash
kubectl apply -f deployments/06-matrix.yaml
kubectl wait --for=condition=ready pod -l app=matrix-synapse -n caritas --timeout=300s
```

#### 10. Deploy Nginx Proxy

```bash
kubectl apply -f configmaps/nginx-config.yaml
kubectl apply -f deployments/08-nginx-proxy.yaml
```

#### 11. Deploy Monitoring

```bash
kubectl apply -f deployments/10-monitoring.yaml
```

#### 12. Deploy Services

```bash
kubectl apply -f services/all-services.yaml
```

---

## 🔍 Verification

### Check All Pods

```bash
kubectl get pods -n caritas

# All pods should be Running
# Expected: 15-20 pods
```

### Check Services

```bash
kubectl get svc -n caritas

# All services should have ClusterIP or LoadBalancer addresses
```

### Check PVCs (Production mode only)

```bash
kubectl get pvc -n caritas

# Expected (production):
# mariadb-storage-mariadb-0   Bound    10Gi
# mongodb-storage-mongodb-0   Bound    10Gi
```

### Health Checks

```bash
# Backend services
curl http://127.0.0.1:8081/actuator/health  # TenantService
curl http://127.0.0.1:8082/actuator/health  # UserService
curl http://127.0.0.1:8083/actuator/health  # ConsultingTypeService
curl http://127.0.0.1:8084/actuator/health  # AgencyService

# Frontend
curl -I http://127.0.0.1:9001

# Admin
curl -I http://127.0.0.1:9002

# Keycloak
curl -I http://127.0.0.1:8080

# Matrix
curl http://127.0.0.1:8008/_matrix/client/versions
```

---

## 🌐 Access URLs

```bash
# Get server IP
SERVER_IP=$(hostname -I | awk '{print $1}')

echo "Frontend:         http://$SERVER_IP:9001"
echo "Admin:            http://$SERVER_IP:9002"
echo "Nginx Proxy:      http://$SERVER_IP:8089"
echo "Keycloak:         http://$SERVER_IP:8080"
echo "Matrix:           http://$SERVER_IP:8008"
echo "Element.io:       http://$SERVER_IP:8087"
echo "Health Dashboard: http://$SERVER_IP:9100"
echo "Redis Commander:  http://$SERVER_IP:9021"
```

---

## 🛠️ Common Operations

### Restart a Service

```bash
kubectl rollout restart deployment/<service-name> -n caritas
```

### View Logs

```bash
kubectl logs deployment/<service-name> -n caritas --tail=100
kubectl logs deployment/<service-name> -n caritas -f  # Follow logs
```

### Scale a Service

```bash
kubectl scale deployment/<service-name> --replicas=2 -n caritas
```

### Update Configuration

```bash
# Edit ConfigMap
kubectl edit configmap oriso-nginx-config -n caritas

# Reload service
kubectl rollout restart deployment/cob-proxy -n caritas
```

### Delete Everything

```bash
kubectl delete namespace caritas
# This will delete all resources in the namespace
```

---

## 📚 Documentation

- **[BUILD_GUIDE.md](../BUILD_GUIDE.md)** - Complete build and deployment guide
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Detailed deployment procedures
- **[STATUS.md](STATUS.md)** - Current deployment status
- **[GITHUB_ISSUE_RESPONSES.md](../GITHUB_ISSUE_RESPONSES.md)** - GitHub issue resolutions
- **[ORISO-Database/SETUP_GUIDE.md](../ORISO-Database/SETUP_GUIDE.md)** - Database setup guide

---

## 🐛 Troubleshooting

### Pods Not Starting

```bash
# Check pod events
kubectl describe pod <pod-name> -n caritas

# Check logs
kubectl logs <pod-name> -n caritas

# Common issues:
# - ImagePullBackOff: Image not found (build and import image)
# - CrashLoopBackOff: Application error (check logs)
# - Pending: Resource constraints (check node resources)
```

### Database Connection Errors

```bash
# Check database pods
kubectl get pods -n caritas | grep -E "mariadb|mongodb"

# Test database connectivity
MARIADB_POD=$(kubectl get pods -n caritas -l app=mariadb -o jsonpath="{.items[0].metadata.name}")
kubectl exec -it -n caritas $MARIADB_POD -- mysql -u root -pPassword1234! -e "SHOW DATABASES;"
```

### Service Not Accessible

```bash
# Check service
kubectl get svc -n caritas <service-name>

# Check endpoints
kubectl get endpoints -n caritas <service-name>

# Port forward for testing
kubectl port-forward -n caritas svc/<service-name> 8080:8080
```

---

## 🔐 Security Notes

**⚠️ IMPORTANT**: Change default passwords in production!

```bash
# Default passwords (CHANGE THESE):
# - MariaDB root: Password1234!
# - MariaDB user: caritas / caritas
# - Keycloak admin: admin / admin
# - RabbitMQ: admin / admin
```

---

## 📝 Version History

### v3.0.0 (November 28, 2025)
- ✅ Removed all duplicate and example files
- ✅ Cleaned up all deployment files (removed status/metadata)
- ✅ Updated to use PVCs instead of hostPath for persistent storage
- ✅ Standardized image naming to `oriso-*` convention
- ✅ Updated all documentation to reflect production-ready structure
- ✅ Removed hardcoded paths - fully portable
- ✅ Added proper resource limits and health checks

### v2.0.0 (November 16, 2025)
- ✅ Added production deployment files without hardcoded paths
- ✅ Implemented StatefulSets with PVCs for databases
- ✅ Created comprehensive BUILD_GUIDE.md
- ✅ Fixed GitHub issues #5, #6, #7
- ✅ Added proper resource limits and health checks

### v1.0.0 (October 14, 2025)
- Initial Kubernetes deployment
- Development mode with hostPath mounts
- Basic infrastructure setup

---

## 🤝 Contributing

When making changes:
1. Test in a separate namespace first
2. Update documentation
3. Verify all health checks pass
4. Update version numbers

---

## 📞 Support

For issues and questions:
- Check [Troubleshooting](#-troubleshooting) section
- Review [BUILD_GUIDE.md](../BUILD_GUIDE.md)
- Check [GITHUB_ISSUE_RESPONSES.md](../GITHUB_ISSUE_RESPONSES.md)
- Review pod logs: `kubectl logs <pod> -n caritas`

---

**Last Updated**: November 28, 2025  
**Maintainer**: ORISO Platform Team  
**License**: Proprietary
