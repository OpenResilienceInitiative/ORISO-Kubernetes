# ORISO Platform - Quick Start Guide

**For New Users - Get Started in Minutes**

**Version**: 3.0.0  
**Last Updated**: November 28, 2025  
**Status**: Production Ready

---

## 🎯 What You'll Get

A complete ORISO (Online Beratung) platform running on Kubernetes with:
- ✅ All backend services (Tenant, User, Agency, ConsultingType, Upload, Video)
- ✅ Frontend and Admin Panel
- ✅ Authentication (Keycloak)
- ✅ Real-time Communication (Matrix Synapse)
- ✅ Databases (MariaDB, MongoDB, Redis, RabbitMQ)
- ✅ Monitoring and Health Dashboard

---

## ⚡ Prerequisites (5 minutes)

### 1. Fresh Ubuntu Server
- Ubuntu 22.04 LTS (recommended) or 20.04 LTS
- 4+ CPU cores, 8GB+ RAM, 50GB+ disk
- Root or sudo access

### 2. Install Kubernetes (k3s)
```bash
# Install k3s (lightweight Kubernetes)
curl -sfL https://get.k3s.io | sh -

# Configure kubectl
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config

# Verify
kubectl get nodes
```

### 3. Install Docker (for building images)
```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker

# Verify
docker --version
```

---

## 🚀 Quick Deployment (30 minutes)

### Step 1: Clone/Transfer ORISO Repositories

```bash
# Create workspace (use your preferred location)
mkdir -p ~/workspace
cd ~/workspace

# Transfer or clone all ORISO-* repositories here
# You need:
# - ORISO-Kubernetes/
# - ORISO-Database/
# - ORISO-Keycloak/
# - ORISO-Frontend/
# - ORISO-Admin/
# - ORISO-UserService/
# - ORISO-TenantService/
# - ORISO-AgencyService/
# - ORISO-ConsultingTypeService/
# - ORISO-Matrix/
# - ORISO-Nginx/
```

### Step 2: Create Namespace

```bash
kubectl create namespace caritas
```

### Step 3: Deploy Infrastructure

```bash
cd ~/workspace/ORISO-Kubernetes

# Deploy databases (MariaDB, MongoDB, RabbitMQ)
kubectl apply -f deployments/01-infrastructure.yaml

# Deploy Redis
kubectl apply -f deployments/02-redis-stack.yaml

# Wait for databases (2-3 minutes)
kubectl wait --for=condition=ready pod -l app=mariadb -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=mongodb -n caritas --timeout=300s
```

### Step 4: Setup Databases

```bash
cd ~/workspace/ORISO-Database

# Run master setup script
./scripts/setup/00-master-setup.sh

# This will:
# - Create all MariaDB databases
# - Import all schemas
# - Setup MongoDB collections
```

### Step 5: Apply ConfigMaps and Secrets ⭐ **REQUIRED**

```bash
cd ~/workspace/ORISO-Kubernetes

# Apply all ConfigMaps and Secrets
./scripts/apply-configmaps-secrets.sh

# Or manually:
kubectl apply -f configmaps/services/
kubectl apply -f secrets/services/

# Verify
kubectl get configmaps,secrets -n caritas | grep -E "userservice|tenantservice|agencyservice|consultingtypeservice"
```

### Step 6: Build and Import Docker Images

```bash
# Build all service images
cd ~/online-beratung/caritas-workspace

# Build UserService
cd ORISO-UserService
docker build -t oriso-userservice:latest .
docker save oriso-userservice:latest | sudo k3s ctr images import -

# Build TenantService
cd ../ORISO-TenantService
docker build -t oriso-tenantservice:latest .
docker save oriso-tenantservice:latest | sudo k3s ctr images import -

# Build AgencyService
cd ../ORISO-AgencyService
docker build -t oriso-agencyservice:latest .
docker save oriso-agencyservice:latest | sudo k3s ctr images import -

# Build ConsultingTypeService
cd ../ORISO-ConsultingTypeService
docker build -t oriso-consultingtypeservice:latest .
docker save oriso-consultingtypeservice:latest | sudo k3s ctr images import -

# Build Frontend
cd ../ORISO-Frontend
docker build -t oriso-frontend:latest .
docker save oriso-frontend:latest | sudo k3s ctr images import -

# Build Admin
cd ../ORISO-Admin
docker build -t oriso-admin:latest .
docker save oriso-admin:latest | sudo k3s ctr images import -
```

### Step 7: Deploy Keycloak

```bash
cd ~/workspace/ORISO-Kubernetes

# Deploy Keycloak
kubectl apply -f deployments/03-keycloak.yaml

# Wait for Keycloak (5-10 minutes)
kubectl wait --for=condition=ready pod -l app=keycloak -n caritas --timeout=600s

# Configure Keycloak for HTTP
./scripts/configure-keycloak-http.sh

# Import realm
KEYCLOAK_POD=$(kubectl get pods -n caritas -l app=keycloak -o jsonpath="{.items[0].metadata.name}")
kubectl cp ../ORISO-Keycloak/realm.json caritas/$KEYCLOAK_POD:/tmp/realm.json
kubectl exec -n caritas $KEYCLOAK_POD -- /opt/keycloak/bin/kc.sh import --file /tmp/realm.json
```

### Step 8: Deploy Backend Services

```bash
cd ~/workspace/ORISO-Kubernetes

# Deploy backend services (uses ConfigMaps/Secrets)
kubectl apply -f deployments/04-backend-services-production.yaml

# Wait for services (5-10 minutes)
kubectl wait --for=condition=ready pod -l tier=backend -n caritas --timeout=900s

# Check status
kubectl get pods -n caritas | grep -E "tenant|user|consulting|agency"
```

### Step 9: Deploy Frontend

```bash
cd ~/workspace/ORISO-Kubernetes

# Deploy frontend and admin
kubectl apply -f deployments/05-frontend.yaml

# Wait for frontend
kubectl wait --for=condition=ready pod -l tier=frontend -n caritas --timeout=300s
```

### Step 10: Deploy Matrix Communication

```bash
cd ~/workspace/ORISO-Kubernetes

# Deploy Matrix Synapse
kubectl apply -f deployments/06-matrix.yaml

# Wait for Matrix
kubectl wait --for=condition=ready pod -l app=matrix-synapse -n caritas --timeout=300s
```

### Step 11: Deploy Nginx Proxy

```bash
cd ~/workspace/ORISO-Kubernetes

# Deploy Nginx ConfigMap
kubectl apply -f configmaps/nginx-config.yaml

# Deploy Nginx proxy
kubectl apply -f deployments/08-nginx-proxy.yaml

# Wait for Nginx
kubectl wait --for=condition=ready pod -l app=cob-proxy -n caritas --timeout=180s
```

### Step 12: Deploy Services

```bash
cd ~/workspace/ORISO-Kubernetes

# Apply all Kubernetes services
kubectl apply -f services/all-services.yaml
```

---

## ✅ Verification

### Check All Pods

```bash
kubectl get pods -n caritas

# All pods should be Running
# Expected: 15-20 pods
```

### Check Service Health

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

### Get Access URLs

```bash
SERVER_IP=$(hostname -I | awk '{print $1}')

echo "Frontend:    http://$SERVER_IP:9001"
echo "Admin:       http://$SERVER_IP:9002"
echo "Nginx Proxy: http://$SERVER_IP:8089"
echo "Keycloak:    http://$SERVER_IP:8080"
```

---

## 🐛 Troubleshooting

### Service Won't Start

```bash
# Check logs
kubectl logs deployment/<service-name> -n caritas

# Look for ConfigurationValidator errors:
# "CRITICAL: Missing required configuration values..."

# Fix: Apply ConfigMaps/Secrets
kubectl apply -f configmaps/services/
kubectl apply -f secrets/services/
kubectl rollout restart deployment/<service-name> -n caritas
```

### Database Connection Errors

```bash
# Check database pods
kubectl get pods -n caritas | grep -E "mariadb|mongodb"

# Test connection
MARIADB_POD=$(kubectl get pods -n caritas -l app=mariadb -o jsonpath="{.items[0].metadata.name}")
kubectl exec -it -n caritas $MARIADB_POD -- mysql -u root -proot -e "SHOW DATABASES;"
```

### Image Not Found

```bash
# Check if image exists
sudo k3s ctr images ls | grep oriso

# If missing, build and import:
docker build -t oriso-<service>:latest .
docker save oriso-<service>:latest | sudo k3s ctr images import -
```

---

## 📚 Next Steps

1. **Read Full Guide**: See `README.md` for complete documentation
2. **HTTPS Setup**: See `README.md` Section 16 for SSL certificates
3. **Customize**: Update ConfigMaps/Secrets for your environment
4. **Monitor**: Check `STATUS.md` for deployment status

---

## 🆘 Need Help?

1. Check logs: `kubectl logs <pod> -n caritas`
2. Check events: `kubectl get events -n caritas`
3. Review troubleshooting in `README.md`
4. Check individual service READMEs in ORISO-* directories

---

**That's it! Your ORISO platform is now running.** 🎉

