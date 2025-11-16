# ORISO Platform - Build & Deployment Guide

**Complete guide for building Docker images and deploying to Kubernetes**

**Version**: 1.0.0  
**Last Updated**: November 16, 2025  
**Target**: Production Kubernetes Deployment

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Building Docker Images](#building-docker-images)
3. [Deploying to Kubernetes](#deploying-to-kubernetes)
4. [Configuration Management](#configuration-management)
5. [Troubleshooting](#troubleshooting)

---

## 1. Prerequisites

### Required Software

```bash
# Docker
docker --version  # Should be 20.10+

# Kubernetes CLI
kubectl version --client  # Should be 1.21+

# Node.js (for Frontend/Admin builds)
node --version  # Should be 18.16+
npm --version   # Should be 9.5+

# Java & Maven (for Backend services)
java --version  # Should be 17+
mvn --version   # Should be 3.8+
```

### Access Requirements

- Access to Kubernetes cluster (k3s)
- Docker daemon running
- Sufficient disk space (minimum 20GB free)

---

## 2. Building Docker Images

### 2.1 Frontend

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Frontend

# Install dependencies
npm install

# Build production bundle
npm run build

# Build Docker image
docker build -t oriso-frontend:latest .

# Tag with version (optional)
docker tag oriso-frontend:latest oriso-frontend:$(date +%Y%m%d-%H%M%S)

# Import into k3s
docker save oriso-frontend:latest | sudo k3s ctr images import -

# Verify image is available
sudo k3s ctr images ls | grep oriso-frontend
```

**Build output**: `build/` directory containing production-ready static files

**Docker image size**: ~200-300MB

### 2.2 Admin Panel

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Admin

# Install dependencies
npm install

# Build production bundle
npm run build

# Build Docker image
docker build -t oriso-admin:latest .

# Tag with version (optional)
docker tag oriso-admin:latest oriso-admin:$(date +%Y%m%d-%H%M%S)

# Import into k3s
docker save oriso-admin:latest | sudo k3s ctr images import -

# Verify image is available
sudo k3s ctr images ls | grep oriso-admin
```

**Build output**: `build/` directory containing production-ready static files

**Docker image size**: ~150-200MB

### 2.3 Backend Services (Java/Maven)

Backend services can be deployed in two modes:

#### Option A: Pre-built JAR (Production - Recommended)

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-<ServiceName>

# Build JAR
mvn clean package -DskipTests

# Build Docker image
docker build -t oriso-<servicename>:latest .

# Import into k3s
docker save oriso-<servicename>:latest | sudo k3s ctr images import -
```

#### Option B: Live Development (Current Setup)

The current deployment uses Maven containers that mount source code and run `mvn spring-boot:run` directly. This is useful for development but not recommended for production.

**Services using this mode:**
- TenantService
- UserService
- ConsultingTypeService
- AgencyService

**Advantages:**
- Hot reload during development
- No need to rebuild Docker images
- Faster iteration

**Disadvantages:**
- Slower startup times
- Higher resource usage
- Not suitable for production

---

## 3. Deploying to Kubernetes

### 3.1 Deployment Architecture

```
ORISO Platform
├── Infrastructure Layer (01-infrastructure.yaml)
│   ├── MariaDB (with PVC)
│   ├── MongoDB (with PVC)
│   └── RabbitMQ
├── Redis Stack (02-redis-stack.yaml)
│   ├── Redis (with PVC)
│   ├── Redis Commander
│   └── Redis Exporter
├── Authentication (03-keycloak.yaml)
│   └── Keycloak (with PVC)
├── Backend Services (04-backend-services.yaml)
│   ├── TenantService
│   ├── UserService
│   ├── ConsultingTypeService
│   ├── AgencyService
│   ├── UploadService
│   └── VideoService
├── Frontend (05-frontend.yaml)
│   ├── Frontend (React SPA)
│   └── Admin Panel
├── Communication (06-matrix.yaml)
│   ├── Matrix Synapse (with PVC)
│   ├── Matrix PostgreSQL (with PVC)
│   └── Element.io
├── Proxy (08-nginx-proxy.yaml)
│   └── Nginx API Gateway
└── Monitoring (10-monitoring.yaml)
    └── Health Dashboard
```

### 3.2 Deployment Order

**IMPORTANT**: Deploy in this exact order to ensure dependencies are met.

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes

# 1. Create namespace
kubectl create namespace caritas

# 2. Deploy infrastructure (databases)
kubectl apply -f deployments/01-infrastructure.yaml
kubectl wait --for=condition=ready pod -l app=mariadb -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=mongodb -n caritas --timeout=300s

# 3. Deploy Redis stack
kubectl apply -f deployments/02-redis-stack.yaml
kubectl wait --for=condition=ready pod -l app=redis -n caritas --timeout=180s

# 4. Deploy Keycloak
kubectl apply -f deployments/03-keycloak.yaml
kubectl wait --for=condition=ready pod -l app=keycloak -n caritas --timeout=600s

# 5. Initialize databases
cd ../ORISO-Database
./scripts/setup/00-master-setup.sh

# 6. Deploy backend services
cd ../ORISO-Kubernetes
kubectl apply -f deployments/04-backend-services.yaml
# Wait 5-10 minutes for all services to start

# 7. Deploy frontend
kubectl apply -f deployments/05-frontend.yaml
kubectl wait --for=condition=ready pod -l app=frontend -n caritas --timeout=300s

# 8. Deploy Matrix communication
kubectl apply -f deployments/06-matrix.yaml
kubectl wait --for=condition=ready pod -l app=matrix-synapse -n caritas --timeout=300s

# 9. Deploy Nginx proxy
kubectl apply -f configmaps/nginx-config.yaml
kubectl apply -f deployments/08-nginx-proxy.yaml

# 10. Deploy monitoring (optional)
kubectl apply -f deployments/10-monitoring.yaml

# 11. Deploy all services
kubectl apply -f services/all-services.yaml
```

### 3.3 Automated Deployment

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes

# Run master deployment script
./scripts/deploy-all.sh

# The script will:
# - Check prerequisites
# - Deploy all components in correct order
# - Wait for readiness
# - Verify deployment
# - Display access URLs
```

---

## 4. Configuration Management

### 4.1 Environment Variables

Backend services use environment variables for configuration. These are defined in deployment YAML files.

**Common variables:**

```yaml
env:
  - name: SPRING_PROFILES_ACTIVE
    value: "prod"
  - name: SPRING_DATASOURCE_URL
    value: "jdbc:mariadb://mariadb:3306/<database>"
  - name: SPRING_DATASOURCE_USERNAME
    value: "caritas"
  - name: SPRING_DATASOURCE_PASSWORD
    value: "caritas"
  - name: KEYCLOAK_AUTH_SERVER_URL
    value: "http://keycloak:8080"
  - name: SPRING_RABBITMQ_HOST
    value: "rabbitmq"
```

### 4.2 ConfigMaps

Nginx configuration is managed via ConfigMap:

```bash
# View current config
kubectl get configmap oriso-nginx-config -n caritas -o yaml

# Edit config
kubectl edit configmap oriso-nginx-config -n caritas

# Reload Nginx after config change
kubectl rollout restart deployment/cob-proxy -n caritas
```

### 4.3 Secrets

**IMPORTANT**: Change default passwords in production!

```bash
# MariaDB
kubectl create secret generic mariadb-secret \
  --from-literal=root-password='YourStrongPassword' \
  -n caritas

# Keycloak
kubectl create secret generic keycloak-secret \
  --from-literal=admin-password='YourStrongPassword' \
  -n caritas
```

### 4.4 Persistent Storage

All databases use PersistentVolumeClaims (PVCs) for data persistence:

```bash
# View PVCs
kubectl get pvc -n caritas

# Expected PVCs:
# - mariadb-pvc (10Gi)
# - mongodb-pvc (10Gi)
# - redis-pvc (5Gi)
# - keycloak-pvc (2Gi)
# - matrix-synapse-pvc (5Gi)
# - matrix-postgres-pvc (5Gi)
```

---

## 5. Troubleshooting

### 5.1 Image Pull Errors

**Problem**: `ImagePullBackOff` or `ErrImagePull`

**Solution**:

```bash
# Check if image exists in k3s
sudo k3s ctr images ls | grep <image-name>

# If missing, rebuild and import
docker build -t <image-name>:latest .
docker save <image-name>:latest | sudo k3s ctr images import -

# Force pod restart
kubectl delete pod -l app=<app-name> -n caritas
```

### 5.2 Build Failures

**Frontend/Admin build fails:**

```bash
# Clear npm cache
npm cache clean --force

# Remove node_modules and package-lock.json
rm -rf node_modules package-lock.json

# Reinstall
npm install

# Rebuild
npm run build
```

**Backend build fails:**

```bash
# Clear Maven cache
mvn clean

# Skip tests if they're failing
mvn package -DskipTests

# Skip spotless formatting checks
mvn package -DskipTests -Dspotless.check.skip=true
```

### 5.3 Pod Crashes

**Check logs:**

```bash
kubectl logs deployment/<name> -n caritas --tail=100
kubectl logs deployment/<name> -n caritas --previous  # Previous crash
```

**Common issues:**
- Database connection failed → Check database pod is running
- Out of memory → Increase resource limits in deployment YAML
- Port already in use → Check for port conflicts

### 5.4 Service Not Accessible

```bash
# Check service
kubectl get svc -n caritas <service-name>

# Check endpoints
kubectl get endpoints -n caritas <service-name>

# Test from inside cluster
kubectl run test-pod --rm -it --image=busybox -n caritas -- /bin/sh
wget -O- http://<service-name>:<port>
```

---

## Quick Reference

### Build All Images

```bash
# Frontend
cd ORISO-Frontend && npm run build && docker build -t oriso-frontend:latest . && docker save oriso-frontend:latest | sudo k3s ctr images import -

# Admin
cd ../ORISO-Admin && npm run build && docker build -t oriso-admin:latest . && docker save oriso-admin:latest | sudo k3s ctr images import -
```

### Deploy All Services

```bash
cd ORISO-Kubernetes && ./scripts/deploy-all.sh
```

### Check Status

```bash
kubectl get pods -n caritas
kubectl get svc -n caritas
kubectl get pvc -n caritas
```

### Restart Service

```bash
kubectl rollout restart deployment/<name> -n caritas
```

---

**For detailed deployment instructions, see [README.md](README.md)**

**For database setup, see [ORISO-Database/SETUP_GUIDE.md](ORISO-Database/SETUP_GUIDE.md)**

**For Kubernetes configuration, see [ORISO-Kubernetes/DEPLOYMENT.md](ORISO-Kubernetes/DEPLOYMENT.md)**

