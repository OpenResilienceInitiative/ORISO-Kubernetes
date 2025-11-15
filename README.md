# ORISO-Kubernetes

**Complete Kubernetes Deployment Configuration for ORISO Platform**

This repository contains all Kubernetes manifests, deployment scripts, and documentation needed to deploy the complete ORISO (Online Beratung) platform from scratch on any Kubernetes cluster.

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Prerequisites](#prerequisites)
4. [Quick Start](#quick-start)
5. [Components](#components)
6. [Deployment Order](#deployment-order)
7. [Post-Deployment Configuration](#post-deployment-configuration)
8. [Verification](#verification)
9. [Troubleshooting](#troubleshooting)
10. [Maintenance](#maintenance)

---

## 🎯 Overview

The ORISO platform is a comprehensive online counseling system built on Kubernetes with the following components:

### Core Services
- **Frontend** (React/Vite) - Main user interface
- **Admin** (React/Vite) - Administrative interface
- **TenantService** (Spring Boot) - Tenant management
- **UserService** (Spring Boot) - User management & Matrix integration
- **AgencyService** (Spring Boot) - Agency management
- **ConsultingTypeService** (Spring Boot) - Consulting type configuration
- **UploadService** (Spring Boot) - File upload handling
- **VideoService** (Spring Boot) - Video call integration

### Infrastructure
- **MariaDB** - Primary relational database (7 databases)
- **MongoDB** - Document storage for consulting types
- **Redis** - Caching & session management
- **RabbitMQ** - Message queue
- **Keycloak** - Authentication & authorization (SSO/OIDC)

### Communication
- **Matrix Synapse** - Real-time messaging server
- **Element.io** - Matrix web client (optional)
- **Jitsi Meet** - Video conferencing

### Proxy & Routing
- **Nginx (cob-proxy)** - Reverse proxy & SSL termination

### Observability
- **SignOZ** - Traces, metrics, and logs (OpenTelemetry)
- **Health Dashboard** - Custom service health monitoring
- **Redis Commander** - Redis GUI
- **Redis Exporter** - Prometheus metrics

---

## 🏗️ Architecture

```
Internet → Cloudflare (SSL/DNS)
    ↓
Nginx (cob-proxy) :8089 → Keycloak :8080
    ↓                  → Frontend :9001
    ↓                  → Admin :9002
    ↓                  → Backend Services :8081-8086
    ↓                  → Matrix Synapse :8008
    ↓                  → Health Dashboard :9100
    ↓
Backend Services ←→ MariaDB :3306
                 ←→ MongoDB :27017
                 ←→ Redis :6379
                 ←→ RabbitMQ :5672
                 ←→ Keycloak :8080
                 ←→ Matrix Synapse :8008
                 ←→ SignOZ OTEL :4317
```

---

## 📦 Prerequisites

### Required
- **Kubernetes cluster** (k3s recommended)
  - Version: 1.21+
  - Minimum: 4 CPU cores, 8GB RAM
  - Recommended: 8 CPU cores, 16GB RAM
- **kubectl** configured and connected to cluster
- **Persistent storage** (local-path provisioner for k3s)
- **Domain name** (optional, for external access)

### Optional
- **Helm** (for SignOZ deployment)
- **Docker** (for building custom images)
- **Git** (for version control)

### System Requirements
- **OS**: Linux (Ubuntu 20.04/22.04 recommended)
- **Ports**: 80, 443, 8089, 9001, 9002, 3001, 8087, 9021, 9020
- **Storage**: 50GB+ available disk space

---

## 🚀 Quick Start

### Option 1: Automated Deployment (Recommended)

```bash
# Clone or navigate to ORISO-Kubernetes
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes

# Run master deployment script
./scripts/deploy-all.sh

# Wait 10-15 minutes for all components to be ready

# Verify deployment
./scripts/verify-deployment.sh

# Access the platform
# Frontend: http://YOUR_IP:9001
# Admin: http://YOUR_IP:9002
# Keycloak: http://YOUR_IP:8089/auth/admin/
```

### Option 2: Manual Deployment

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed step-by-step instructions.

---

## 📦 Components

### Deployment Files

| Component | File | Replicas | Port(s) | Status |
|-----------|------|----------|---------|--------|
| **Databases** |
| MariaDB | `01-infrastructure.yaml` | 1 | 3306 | ✅ Required |
| MongoDB | `01-infrastructure.yaml` | 1 | 27017 | ✅ Required |
| Redis | `02-redis-stack.yaml` | 1 | 6379 | ✅ Required |
| RabbitMQ | `01-infrastructure.yaml` | 1 | 5672, 15672 | ✅ Required |
| **Authentication** |
| Keycloak | `03-keycloak.yaml` | 1 | 8080, 8443 | ✅ Required |
| **Backend Services** |
| TenantService | `04-backend-services.yaml` | 1 | 8081 | ✅ Required |
| UserService | `04-backend-services.yaml` | 1 | 8082 | ✅ Required |
| ConsultingTypeService | `04-backend-services.yaml` | 1 | 8083 | ✅ Required |
| AgencyService | `04-backend-services.yaml` | 1 | 8084 | ✅ Required |
| UploadService | `04-backend-services.yaml` | 1 | 8085 | ✅ Required |
| VideoService | `04-backend-services.yaml` | 1 | 8086 | ✅ Required |
| **Frontend** |
| Frontend | `05-frontend.yaml` | 1 | 9001 | ✅ Required |
| Admin | `05-frontend.yaml` | 1 | 9002 | ✅ Required |
| **Communication** |
| Matrix Synapse | `06-matrix.yaml` | 1 | 8008 | ✅ Required |
| Element.io | `06-matrix.yaml` | 1 | 8087 | ⚪ Optional |
| Jitsi Meet | `07-jitsi.yaml` | 1 | 8000, 10000 | ⚪ Optional |
| **Proxy** |
| Nginx (cob-proxy) | `08-nginx-proxy.yaml` | 1 | 8089 | ✅ Required |
| **Observability** |
| SignOZ | `09-signoz.yaml` | Multiple | 3001, 4317 | ⚪ Optional |
| Health Dashboard | `10-monitoring.yaml` | 1 | 9100 | ⚪ Optional |
| Redis Commander | `02-redis-stack.yaml` | 1 | 9021 | ⚪ Optional |
| Redis Exporter | `02-redis-stack.yaml` | 1 | 9020 | ⚪ Optional |

---

## 📝 Deployment Order

**CRITICAL**: Deploy components in this exact order to ensure dependencies are met.

### Phase 1: Infrastructure (5-10 minutes)
```bash
kubectl apply -f deployments/01-infrastructure.yaml
kubectl apply -f deployments/02-redis-stack.yaml
kubectl apply -f deployments/03-keycloak.yaml

# Wait for all pods to be Running
kubectl wait --for=condition=ready pod -l app=mariadb -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=mongodb -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=redis -n caritas --timeout=300s
kubectl wait --for=condition=ready pod -l app=keycloak -n caritas --timeout=300s
```

### Phase 2: Post-Infrastructure Configuration
```bash
# CRITICAL: Configure Keycloak for HTTP access
cd /path/to/ORISO-Keycloak
./configure-http-access.sh

# Import Keycloak realm
# Via Admin Console: http://YOUR_IP:8089/auth/admin/
# Upload: ORISO-Keycloak/realm.json
```

### Phase 3: Backend Services (5-10 minutes)
```bash
kubectl apply -f deployments/04-backend-services.yaml

# Wait for all backend services
kubectl wait --for=condition=ready pod -l tier=backend -n caritas --timeout=600s
```

### Phase 4: Frontend (2-5 minutes)
```bash
kubectl apply -f deployments/05-frontend.yaml

# Wait for frontend pods
kubectl wait --for=condition=ready pod -l tier=frontend -n caritas --timeout=300s
```

### Phase 5: Communication (3-5 minutes)
```bash
kubectl apply -f deployments/06-matrix.yaml
kubectl apply -f deployments/07-jitsi.yaml  # Optional

# Wait for Matrix
kubectl wait --for=condition=ready pod -l app=matrix-synapse -n caritas --timeout=300s
```

### Phase 6: Proxy & Monitoring (2-3 minutes)
```bash
kubectl apply -f deployments/08-nginx-proxy.yaml
kubectl apply -f deployments/09-signoz.yaml      # Optional
kubectl apply -f deployments/10-monitoring.yaml  # Optional
```

**Total Deployment Time**: 20-35 minutes

---

## ⚙️ Post-Deployment Configuration

### 1. Keycloak HTTP Access (CRITICAL)
```bash
./scripts/configure-keycloak-http.sh
```

### 2. Import Databases (If Fresh Installation)
```bash
# See ORISO-Database repository
cd /path/to/ORISO-Database
./scripts/setup/00-master-setup.sh
```

### 3. Verify All Services
```bash
./scripts/verify-deployment.sh
```

### 4. Configure External Access
```bash
# Update DNS records
# Point domain to server IP

# Update Nginx configuration if needed
kubectl edit configmap oriso-nginx-config -n caritas
```

---

## ✅ Verification

### Check All Pods
```bash
kubectl get pods -n caritas

# All pods should show "Running" status
# Example output:
# NAME                                      READY   STATUS
# agencyservice-xxx                         1/1     Running
# consultingtypeservice-xxx                 1/1     Running
# frontend-xxx                              1/1     Running
# keycloak-xxx                              1/1     Running
# mariadb-xxx                               1/1     Running
# ...
```

### Check Services
```bash
kubectl get svc -n caritas

# All services should have ClusterIP or LoadBalancer IP
```

### Health Checks
```bash
# Backend services
curl http://127.0.0.1:8081/actuator/health  # TenantService
curl http://127.0.0.1:8082/actuator/health  # UserService
curl http://127.0.0.1:8083/actuator/health  # ConsultingTypeService
curl http://127.0.0.1:8084/actuator/health  # AgencyService

# Frontend
curl http://127.0.0.1:9001  # Should return HTML

# Keycloak
curl http://127.0.0.1:8089/auth/

# Matrix
curl http://127.0.0.1:8008/_matrix/client/versions
```

### Access URLs
- **Frontend**: http://YOUR_IP:9001
- **Admin**: http://YOUR_IP:9002
- **Keycloak Admin**: http://YOUR_IP:8089/auth/admin/ (admin/admin)
- **Redis Commander**: http://YOUR_IP:9021
- **SignOZ**: http://YOUR_IP:3001
- **Health Dashboard**: http://YOUR_IP:9100

---

## 🐛 Troubleshooting

### Common Issues

#### Issue: Pods stuck in "Pending"
**Cause**: Insufficient resources or storage
**Solution**:
```bash
kubectl describe pod <pod-name> -n caritas
# Check "Events" section for details

# Check node resources
kubectl top nodes
```

#### Issue: Backend services "CrashLoopBackOff"
**Cause**: Database not ready or configuration issues
**Solution**:
```bash
# Check logs
kubectl logs <service-pod> -n caritas

# Verify database connections
kubectl exec -it deployment/mariadb -n caritas -- mysql -u root -pPassword1234! -e "SHOW DATABASES;"
```

#### Issue: Keycloak returns "HTTPS required"
**Cause**: HTTP access not configured
**Solution**:
```bash
./scripts/configure-keycloak-http.sh
```

#### Issue: Frontend shows 403 errors
**Cause**: Nginx CORS or proxy configuration
**Solution**:
```bash
kubectl logs deployment/cob-proxy -n caritas
# Check Nginx configuration
kubectl get configmap oriso-nginx-config -n caritas -o yaml
```

See [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) for more details.

---

## 🔧 Maintenance

### Update Services
```bash
# Update specific deployment
kubectl set image deployment/tenantservice \
  tenantservice=your-registry/tenantservice:new-tag -n caritas

# Rollout restart
kubectl rollout restart deployment/tenantservice -n caritas

# Check rollout status
kubectl rollout status deployment/tenantservice -n caritas
```

### Backup
```bash
# Databases
./scripts/backup-databases.sh

# Keycloak realm
cd /path/to/ORISO-Keycloak
./backup/realm-backup.sh

# Redis
cd /path/to/ORISO-Redis
./backup/redis-backup.sh
```

### Scale Services
```bash
# Scale up
kubectl scale deployment/tenantservice --replicas=3 -n caritas

# Scale down
kubectl scale deployment/tenantservice --replicas=1 -n caritas
```

### View Logs
```bash
# Follow logs
kubectl logs -f deployment/tenantservice -n caritas

# View last 100 lines
kubectl logs --tail=100 deployment/tenantservice -n caritas

# View logs from all pods
kubectl logs -l app=tenantservice -n caritas --all-containers=true
```

---

## 📚 Additional Documentation

- [DEPLOYMENT.md](./DEPLOYMENT.md) - Detailed deployment guide
- [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) - Common issues and solutions
- [ARCHITECTURE.md](./ARCHITECTURE.md) - System architecture details
- [NETWORKING.md](./NETWORKING.md) - Network configuration
- [SECURITY.md](./SECURITY.md) - Security best practices

---

## 🔗 Related Repositories

- **ORISO-Database** - Database schemas and setup scripts
- **ORISO-Keycloak** - Keycloak realm configuration
- **ORISO-Redis** - Redis configuration and monitoring
- **ORISO-Matrix** - Matrix Synapse configuration
- **ORISO-Nginx** - Nginx proxy configuration
- **ORISO-SignOZ** - Observability platform
- **ORISO-HealthDashboard** - Health monitoring
- **ORISO-Frontend** - Frontend application
- **ORISO-Admin** - Admin application
- **ORISO-TenantService** - Tenant management service
- **ORISO-UserService** - User management service
- **ORISO-AgencyService** - Agency management service
- **ORISO-ConsultingTypeService** - Consulting type service

---

## 📊 System Requirements Summary

### Minimum
- **CPU**: 4 cores
- **RAM**: 8GB
- **Disk**: 50GB
- **Network**: 1 Gbps

### Recommended (Production)
- **CPU**: 8+ cores
- **RAM**: 16GB+
- **Disk**: 100GB+ SSD
- **Network**: 1 Gbps+
- **Backup**: Daily automated backups

---

## 🎯 Production Readiness Checklist

- [ ] All pods running and healthy
- [ ] Databases configured with persistent storage
- [ ] Keycloak HTTP access configured
- [ ] Keycloak realm imported
- [ ] All services passing health checks
- [ ] Nginx proxy configured correctly
- [ ] SSL certificates installed (if using HTTPS)
- [ ] DNS configured
- [ ] Monitoring and alerting set up
- [ ] Backup strategy implemented
- [ ] Documentation reviewed and updated
- [ ] Security hardening completed
- [ ] Load testing performed
- [ ] Disaster recovery plan in place

---

## 📞 Support

For issues and questions:
1. Check logs: `kubectl logs <pod-name> -n caritas`
2. Check pod status: `kubectl describe pod <pod-name> -n caritas`
3. Review documentation in this repository
4. Check related ORISO-* repositories

---

**Version**: 1.0.0  
**Last Updated**: 2025-10-31  
**Kubernetes Version**: 1.21+  
**Platform**: ORISO (Online Beratung)

---

**This is the master Kubernetes deployment repository for the ORISO platform.**  
**All components, configurations, and documentation are included for a complete deployment.**

