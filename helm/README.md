# ORISO Platform Helm Charts

Complete Helm chart deployment for the ORISO platform.

## 📋 Prerequisites

### Required Components

1. **Kubernetes Cluster** (1.24+)
   ```bash
   kubectl version --client
   kubectl get nodes
   ```

2. **Helm 3.x**
   ```bash
   helm version
   # Install: curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   ```

3. **Nginx Ingress Controller**
   ```bash
   kubectl get ingressclass nginx
   kubectl get pods -n ingress-nginx
   ```

4. **Cert-Manager** (for TLS certificates)
   ```bash
   kubectl get clusterissuer letsencrypt-prod
   ```

5. **Storage Class** (for persistent volumes)
   ```bash
   kubectl get storageclass
   ```

6. **Kubernetes Secrets** (create before deployment)
   ```bash
   kubectl create namespace caritas
   
   # MariaDB
   kubectl create secret generic mariadb-secrets -n caritas \
     --from-literal=MYSQL_ROOT_PASSWORD=your-password \
     --from-literal=MYSQL_DATABASE=caritas
   
   # Redis
   kubectl create secret generic redis-secret -n caritas \
     --from-literal=password=your-password
   
   # RabbitMQ
   kubectl create secret generic rabbitmq-secrets -n caritas \
     --from-literal=RABBITMQ_DEFAULT_USER=admin \
     --from-literal=RABBITMQ_DEFAULT_PASS=admin
   ```

7. **DNS Records** (point to Ingress Controller IP)
   - `api.oriso.org`
   - `app.oriso.org`
   - `admin.oriso.org`
   - `auth.oriso.org`
   - `matrix.oriso.org`
   - And other subdomains as needed

## 🚀 Quick Start

### Deploy Everything (Recommended)

```bash
cd caritas-workspace/ORISO-Kubernetes/helm

# Update chart dependencies
cd oriso-platform
helm dependency update
cd ..

# Deploy
helm install oriso-platform ./oriso-platform \
  --namespace caritas \
  --create-namespace \
  -f values.yaml
```

### Deploy Individual Services

```bash
# Infrastructure
helm install mariadb ./charts/mariadb --namespace caritas
helm install mongodb ./charts/mongodb --namespace caritas
helm install redis ./charts/redis --namespace caritas
helm install rabbitmq ./charts/rabbitmq --namespace caritas

# Authentication
helm install keycloak ./charts/keycloak --namespace caritas -f values.yaml

# Backend Services
helm install userservice ./charts/userservice --namespace caritas -f values.yaml
helm install agencyservice ./charts/agencyservice --namespace caritas -f values.yaml
helm install tenantservice ./charts/tenantservice --namespace caritas -f values.yaml
helm install consultingtypeservice ./charts/consultingtypeservice --namespace caritas -f values.yaml

# Frontend
helm install frontend ./charts/frontend --namespace caritas -f values.yaml
helm install admin ./charts/admin --namespace caritas -f values.yaml
```

## 📁 Structure

```
helm/
├── values.yaml              # Global values (domains, services, databases)
├── charts/                  # Individual service charts
│   ├── frontend/            # Main frontend application
│   ├── admin/               # Admin panel
│   ├── agencyservice/       # Agency management service
│   ├── userservice/         # User management service
│   ├── tenantservice/       # Tenant management service
│   ├── consultingtypeservice/ # Consulting type service
│   ├── keycloak/            # Identity and access management
│   ├── mariadb/             # MariaDB StatefulSet
│   ├── mongodb/             # MongoDB deployment
│   ├── redis/               # Redis cache
│   ├── rabbitmq/            # RabbitMQ message broker
│   ├── matrix-synapse/       # Matrix Synapse server
│   ├── livekit/             # LiveKit WebRTC server
│   └── ...                  # Other services
└── oriso-platform/          # Master umbrella chart
    ├── Chart.yaml           # Chart dependencies
    ├── values.yaml          # Master values
    └── charts/              # Packaged sub-charts
```

## 🔧 Configuration

### Global Values

The `values.yaml` file contains shared configuration:

- **Domains**: All external domains (api, app, auth, matrix, etc.)
- **Keycloak**: JWT validation URLs
- **Matrix**: Server name and URLs
- **CORS**: Cross-origin resource sharing
- **Databases**: Internal Kubernetes DNS for all databases
- **Services**: Internal Kubernetes DNS for all services

### Service URLs

All services use Kubernetes DNS with `oriso-platform-` prefix:

- `http://oriso-platform-userservice.caritas.svc.cluster.local:8082`
- `http://oriso-platform-agencyservice.caritas.svc.cluster.local:8084`
- `http://oriso-platform-consultingtypeservice.caritas.svc.cluster.local:8083`
- `http://oriso-platform-tenantservice.caritas.svc.cluster.local:8081`

### Environment-Specific Values

Create environment-specific value files:

```yaml
# values-prod.yaml
global:
  domains:
    api: "api.oriso.com"
    app: "app.oriso.com"
    auth: "auth.oriso.com"
```

Deploy with:
```bash
helm install oriso-platform ./oriso-platform \
  --namespace caritas \
  -f values.yaml \
  -f values-prod.yaml
```

## 🔄 Upgrade

```bash
cd caritas-workspace/ORISO-Kubernetes/helm

# Update dependencies
cd oriso-platform
helm dependency update
cd ..

# Upgrade
helm upgrade oriso-platform ./oriso-platform \
  --namespace caritas \
  -f values.yaml
```

## 🗑️ Uninstall

```bash
helm uninstall oriso-platform --namespace caritas
```

**Note:** Persistent volumes are retained by default.

## ✅ Verification

```bash
# Check all pods
kubectl get pods -n caritas

# Check services
kubectl get svc -n caritas

# Check Helm release
helm list -n caritas
helm status oriso-platform -n caritas
```

## 🐛 Troubleshooting

### Pods Not Starting

```bash
# Check pod status
kubectl get pods -n caritas

# Check logs
kubectl logs -n caritas <pod-name>

# Check events
kubectl describe pod -n caritas <pod-name>
```

### Database Connection Issues

```bash
# Verify database pods
kubectl get pods -n caritas -l app=mariadb
kubectl get pods -n caritas -l app=mongodb

# Check database logs
kubectl logs -n caritas -l app=mariadb
```

### Service Communication Issues

Verify service URLs use correct DNS names:
```bash
# Check service environment variables
kubectl exec -n caritas <pod-name> -- env | grep SERVICE
```

## 📚 Related Documentation

- [Ingress Configuration](../ingress/README.md)
- [Main Kubernetes README](../README.md)
