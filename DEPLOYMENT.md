# ORISO-Kubernetes Deployment Guide

Complete step-by-step guide for deploying the ORISO platform on Kubernetes.

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Pre-Deployment Checklist](#pre-deployment-checklist)
3. [Automated Deployment](#automated-deployment)
4. [Manual Deployment](#manual-deployment)
5. [Post-Deployment Configuration](#post-deployment-configuration)
6. [Verification](#verification)
7. [Troubleshooting](#troubleshooting)

---

## 📦 Prerequisites

### System Requirements

**Minimum Requirements:**
- CPU: 4 cores
- RAM: 8GB
- Disk: 50GB free space
- OS: Linux (Ubuntu 20.04/22.04 recommended)

**Recommended for Production:**
- CPU: 8+ cores
- RAM: 16GB+
- Disk: 100GB+ SSD
- OS: Ubuntu 22.04 LTS

### Software Requirements

1. **Kubernetes Cluster** (k3s recommended)
   ```bash
   # Install k3s
   curl -sfL https://get.k3s.io | sh -
   
   # Verify installation
   sudo k3s kubectl get nodes
   ```

2. **kubectl** (if not using k3s)
   ```bash
   # Install kubectl
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   
   # Verify
   kubectl version --client
   ```

3. **Configure kubectl** (for k3s)
   ```bash
   # Create kubeconfig
   mkdir -p ~/.kube
   sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
   sudo chown $USER:$USER ~/.kube/config
   
   # Test
   kubectl get nodes
   ```

### Network Requirements

**Required Ports:**
- 80, 443 - HTTP/HTTPS (optional, for external access)
- 8089 - Nginx proxy (main entry point)
- 9001 - Frontend
- 9002 - Admin
- 8087 - Element.io
- 9021 - Redis Commander
- 9020 - Redis Exporter metrics
- 9100 - Health Dashboard
- 3001 - SignOZ (optional)

---

## ✅ Pre-Deployment Checklist

Before starting deployment, ensure:

- [ ] Kubernetes cluster is running and accessible
- [ ] kubectl is configured and working
- [ ] Namespace 'caritas' will be created (or already exists)
- [ ] Sufficient resources available (CPU, RAM, Disk)
- [ ] Network ports are available and not blocked by firewall
- [ ] You have all ORISO-* repositories ready
- [ ] Database schemas are prepared (ORISO-Database)
- [ ] Keycloak realm configuration is ready (ORISO-Keycloak/realm.json)

---

## 🚀 Automated Deployment

### Option 1: Quick Deploy (Recommended for First-Time Setup)

```bash
# Navigate to ORISO-Kubernetes
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes

# Run master deployment script
./scripts/deploy-all.sh

# The script will:
# 1. Check prerequisites
# 2. Create namespace
# 3. Deploy infrastructure (MariaDB, MongoDB, Redis, RabbitMQ)
# 4. Deploy Keycloak
# 5. Deploy backend services
# 6. Deploy frontend applications
# 7. Deploy Matrix Synapse
# 8. Deploy Nginx proxy
# 9. Optionally deploy monitoring

# Total time: 20-35 minutes
```

### What the Script Does:

1. **Phase 1: Infrastructure** (5-10 min)
   - MariaDB (database)
   - MongoDB (document store)
   - RabbitMQ (message queue)
   - Redis (cache)
   - Redis Commander (GUI)
   - Redis Exporter (metrics)

2. **Phase 2: Authentication** (5-10 min)
   - Keycloak (SSO/OIDC)
   - **Pauses for HTTP configuration**

3. **Phase 3: Backend Services** (5-10 min)
   - TenantService
   - UserService
   - ConsultingTypeService
   - AgencyService
   - UploadService
   - VideoService

4. **Phase 4: Frontend** (2-5 min)
   - Frontend (main UI)
   - Admin (admin UI)

5. **Phase 5: Communication** (3-5 min)
   - Matrix Synapse
   - Element.io

6. **Phase 6: Proxy** (2-3 min)
   - Nginx (cob-proxy)

7. **Phase 7: Monitoring** (Optional)
   - Health Dashboard
   - SignOZ (requires Helm)

---

## 🔧 Manual Deployment

### Step 1: Create Namespace

```bash
kubectl create namespace caritas
```

### Step 2: Deploy Infrastructure

```bash
# Apply infrastructure deployments
kubectl apply -f deployments/01-infrastructure.yaml

# Wait for pods to be ready
kubectl wait --for=condition=ready pod -l app=mariadb -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=mongodb -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=rabbitmq -n caritas --timeout=300s

# Verify
kubectl get pods -n caritas
```

### Step 3: Deploy Redis Stack

```bash
# Apply Redis deployments
kubectl apply -f deployments/02-redis-stack.yaml

# Wait for Redis
kubectl wait --for=condition=ready pod -l app=redis -n caritas --timeout=180s

# Verify
kubectl get pods -n caritas | grep redis
```

### Step 4: Deploy Keycloak

```bash
# Apply Keycloak deployment
kubectl apply -f deployments/03-keycloak.yaml

# Wait for Keycloak
kubectl wait --for=condition=ready pod -l app=keycloak -n caritas --timeout=300s

# Verify
kubectl logs deployment/keycloak -n caritas
```

### Step 5: Configure Keycloak for HTTP (CRITICAL!)

**This step is MANDATORY:**

```bash
# Run HTTP configuration script
./scripts/configure-keycloak-http.sh

# Or manually:
KEYCLOAK_POD=$(kubectl get pods -n caritas -l app=keycloak -o jsonpath="{.items[0].metadata.name}")

kubectl exec -n caritas $KEYCLOAK_POD -- \
  /opt/keycloak/bin/kcadm.sh config credentials \
  --server http://localhost:8080 --realm master \
  --user admin --password admin

kubectl exec -n caritas $KEYCLOAK_POD -- \
  /opt/keycloak/bin/kcadm.sh update realms/master -s sslRequired=NONE
```

**Why this is critical:** Keycloak requires HTTPS by default. Since ORISO uses HTTP internally (Nginx handles SSL termination), this configuration is essential for authentication to work.

### Step 6: Deploy Backend Services

```bash
# Apply backend services
kubectl apply -f deployments/04-backend-services.yaml

# Wait for services (this may take several minutes)
kubectl wait --for=condition=ready pod -l tier=backend -n caritas --timeout=600s

# Check each service
kubectl get pods -n caritas | grep -E "tenant|user|consulting|agency"
```

### Step 7: Deploy Frontend

```bash
# Apply frontend deployments
kubectl apply -f deployments/05-frontend.yaml

# Wait for frontend
kubectl wait --for=condition=ready pod -l tier=frontend -n caritas --timeout=300s

# Verify
kubectl get pods -n caritas | grep -E "frontend|admin"
```

### Step 8: Deploy Matrix

```bash
# Apply Matrix deployments
kubectl apply -f deployments/06-matrix.yaml

# Wait for Matrix
kubectl wait --for=condition=ready pod -l app=matrix-synapse -n caritas --timeout=300s

# Verify
kubectl logs deployment/matrix-synapse -n caritas
```

### Step 9: Deploy Nginx Proxy

```bash
# Apply ConfigMap first
kubectl apply -f configmaps/nginx-config.yaml

# Apply Nginx deployment
kubectl apply -f deployments/08-nginx-proxy.yaml

# Wait for Nginx
kubectl wait --for=condition=ready pod -l app=cob-proxy -n caritas --timeout=180s

# Verify
kubectl logs deployment/cob-proxy -n caritas
```

### Step 10: Apply Services

```bash
# Apply all services
kubectl apply -f services/all-services.yaml

# Verify services
kubectl get svc -n caritas
```

### Step 11: Deploy Monitoring (Optional)

```bash
# Deploy health dashboard
kubectl apply -f deployments/10-monitoring.yaml

# For SignOZ, see ORISO-SignOZ repository
```

---

## ⚙️ Post-Deployment Configuration

### 1. Import Keycloak Realm

**CRITICAL:** You must import the realm configuration for authentication to work.

```bash
# Get server IP
hostname -I | awk '{print $1}'

# Access Keycloak Admin Console
# URL: http://YOUR_IP:8089/auth/admin/
# Login: admin / admin

# Steps in Admin Console:
# 1. Select "Master" realm dropdown
# 2. Click "Add realm"
# 3. Click "Select file"
# 4. Upload: /path/to/ORISO-Keycloak/realm.json
# 5. Click "Create"
```

### 2. Setup Databases (Fresh Installation Only)

If this is a fresh installation, you need to setup databases:

```bash
# Navigate to ORISO-Database
cd /path/to/ORISO-Database

# Run master setup script
./scripts/setup/00-master-setup.sh

# This will:
# - Setup MariaDB (7 databases)
# - Apply MariaDB schemas
# - Setup MongoDB
# - Setup Redis
# - Setup RabbitMQ
```

### 3. Configure External Access (Optional)

If you want external HTTPS access via domain:

```bash
# 1. Point your domain to server IP in DNS

# 2. Update Nginx configuration
kubectl edit configmap oriso-nginx-config -n caritas

# 3. Reload Nginx
kubectl rollout restart deployment/cob-proxy -n caritas
```

---

## ✅ Verification

### Quick Verification

```bash
# Run verification script
./scripts/verify-deployment.sh

# This checks:
# - Pod status
# - Service health endpoints
# - Web interface accessibility
# - Kubernetes services
```

### Manual Verification

#### Check All Pods

```bash
kubectl get pods -n caritas

# Expected: All pods showing "Running" status with "1/1" ready
```

#### Check Backend Service Health

```bash
# TenantService
curl http://127.0.0.1:8081/actuator/health
# Expected: {"status":"UP"}

# UserService
curl http://127.0.0.1:8082/actuator/health
# Expected: {"status":"UP"}

# ConsultingTypeService
curl http://127.0.0.1:8083/actuator/health
# Expected: {"status":"UP"}

# AgencyService
curl http://127.0.0.1:8084/actuator/health
# Expected: {"status":"UP"}
```

#### Check Frontend

```bash
# Frontend should return HTML
curl -I http://127.0.0.1:9001
# Expected: HTTP/1.1 200 OK

# Admin should return HTML
curl -I http://127.0.0.1:9002
# Expected: HTTP/1.1 200 OK
```

#### Check Keycloak

```bash
# Keycloak should return JSON
curl http://127.0.0.1:8089/auth/realms/master/.well-known/openid-configuration
# Expected: JSON with configuration
```

#### Check Matrix

```bash
# Matrix should return version info
curl http://127.0.0.1:8008/_matrix/client/versions
# Expected: JSON with versions
```

### Access the Platform

Get your server IP:
```bash
hostname -I | awk '{print $1}'
```

Access URLs:
- **Frontend**: http://YOUR_IP:9001
- **Admin**: http://YOUR_IP:9002
- **Keycloak Admin**: http://YOUR_IP:8089/auth/admin/ (admin/admin)
- **Redis Commander**: http://YOUR_IP:9021
- **Health Dashboard**: http://YOUR_IP:9100
- **Matrix Element**: http://YOUR_IP:8087

---

## 🐛 Troubleshooting

See [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) for detailed troubleshooting guide.

### Common Issues Quick Reference

| Issue | Solution |
|-------|----------|
| Pods stuck in "Pending" | Check resources: `kubectl describe pod <name> -n caritas` |
| Backend service crashes | Check database connectivity and logs |
| "HTTPS required" error | Run `./scripts/configure-keycloak-http.sh` |
| Frontend 403 errors | Check Nginx proxy configuration |
| Can't access services | Check firewall: `sudo ufw status` |
| Database connection fails | Verify database pods are running |
| Keycloak login fails | Import realm configuration |

---

## 🔄 Next Steps

After successful deployment:

1. **Test Authentication**: Try logging into Frontend
2. **Setup First Tenant**: Use Admin interface
3. **Configure Users**: Create test users
4. **Test Matrix Chat**: Send test messages
5. **Setup Monitoring**: Configure SignOZ and Health Dashboard
6. **Setup Backups**: Configure automated backups
7. **Review Security**: Harden production settings
8. **Load Testing**: Test with expected user load
9. **Documentation**: Document any custom configurations
10. **Disaster Recovery**: Test backup and restore procedures

---

## 📚 Additional Resources

- **ORISO-Database**: Database setup and schemas
- **ORISO-Keycloak**: Realm configuration and authentication
- **ORISO-Redis**: Caching and session management
- **ORISO-Matrix**: Real-time messaging
- **ORISO-Nginx**: Proxy configuration
- **ORISO-SignOZ**: Observability and monitoring
- **Service READMEs**: Individual service documentation

---

**Deployment Time**: 20-35 minutes  
**Difficulty**: Intermediate  
**Prerequisites**: Basic Kubernetes knowledge

---

**For support, check logs and pod events:**
```bash
kubectl logs <pod-name> -n caritas
kubectl describe pod <pod-name> -n caritas
```

