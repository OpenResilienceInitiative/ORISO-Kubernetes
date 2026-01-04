# ORISO Platform Master Chart

This is the master/umbrella Helm chart that deploys the complete ORISO platform with all services in the correct order.

## 📦 What It Deploys

This chart deploys **21 services** organized by dependency:

### Phase 1: Infrastructure (Databases & Message Queue)
- MariaDB (StatefulSet)
- MongoDB
- Redis
- RabbitMQ

### Phase 2: Authentication & Communication
- Keycloak
- Matrix Synapse
- Element (Matrix client)
- Element Call (video calling)

### Phase 3: WebRTC
- LiveKit (main + token service)

### Phase 4: Backend Services
- TenantService
- UserService
- AgencyService
- ConsultingTypeService

### Phase 5: Frontend Services
- Frontend (main application)
- Admin Panel

### Phase 6: Monitoring & Utilities
- Redis Commander (Redis GUI)
- Redis Exporter (metrics)
- Status Page
- Health Dashboard
- Storybook (development)
- SigNoz (observability)

## 🚀 Quick Start

### Prerequisites

1. **Install Nginx Ingress Controller** (see `../PREREQUISITES.md`)
2. **Install Cert-Manager** (see `../PREREQUISITES.md`)
3. **Create required Secrets** (see `../PREREQUISITES.md`)
4. **Build Docker images** (see service-specific build guides)

### Deploy Everything

```bash
cd caritas-workspace/ORISO-Kubernetes/helm

# Update dependencies
helm dependency update oriso-platform

# Deploy everything
helm install oriso-platform ./oriso-platform \
  --namespace caritas \
  --create-namespace \
  -f values.yaml
```

### Deploy with Custom Values

```bash
# Use environment-specific values
helm install oriso-platform ./oriso-platform \
  --namespace caritas \
  --create-namespace \
  -f values.yaml \
  -f values-prod.yaml
```

### Upgrade Existing Deployment

```bash
helm upgrade oriso-platform ./oriso-platform \
  --namespace caritas \
  -f values.yaml
```

### Uninstall

```bash
helm uninstall oriso-platform --namespace caritas
```

## ⚙️ Configuration

### Enable/Disable Services

Edit `values.yaml` to enable/disable services:

```yaml
# Disable a service
storybook:
  enabled: false

# Enable a service
frontend:
  enabled: true
```

### Service-Specific Configuration

Each service can be configured individually. See individual chart READMEs:
- `charts/frontend/README.md`
- `charts/agencyservice/README.md`
- etc.

### Global Values

All services inherit global values from `values.yaml`:
- Domains (api, app, auth, matrix, etc.)
- Keycloak configuration
- Matrix configuration
- CORS settings
- Database URLs
- Service URLs

## 📋 Deployment Order

Helm automatically handles dependencies, but services deploy in this order:

1. **Infrastructure** (mariadb, mongodb, redis, rabbitmq)
2. **Authentication** (keycloak)
3. **Communication** (matrix-synapse, element, element-call)
4. **WebRTC** (livekit)
5. **Backend Services** (tenantservice, userservice, agencyservice, consultingtypeservice)
6. **Frontend Services** (frontend, admin)
7. **Monitoring** (redis-commander, redis-exporter, status-page, health-dashboard, storybook, signoz)

## 🔍 Verification

### Check Deployment Status

```bash
# Check all pods
kubectl get pods -n caritas

# Check specific service
kubectl get pods -n caritas -l app=frontend

# Check Helm releases
helm list -n caritas
```

### Check Service Health

```bash
# Check all services
kubectl get svc -n caritas

# Check Ingress
kubectl get ingress -n caritas
```

## 🐛 Troubleshooting

### Service Not Starting?

1. Check pod logs: `kubectl logs -n caritas <pod-name>`
2. Check pod events: `kubectl describe pod -n caritas <pod-name>`
3. Check dependencies: Ensure infrastructure services are running
4. Check secrets: Ensure all required secrets exist

### Database Connection Issues?

1. Verify database pods are running: `kubectl get pods -n caritas -l app=mariadb`
2. Check database logs: `kubectl logs -n caritas -l app=mariadb`
3. Verify DNS: Services should use full DNS names (`.svc.cluster.local`)

### Ingress Not Working?

1. Check Ingress Controller: `kubectl get pods -n ingress-nginx`
2. Check IngressClass: `kubectl get ingressclass nginx`
3. Check Ingress resources: `kubectl get ingress -n caritas`
4. Check certificates: `kubectl get certificate -n caritas`

## 📚 Additional Resources

- [Helm Charts README](../README.md)
- [Prerequisites Guide](../PREREQUISITES.md)
- [Ingress Configuration](../../ingress/README.md)
- [Individual Chart Documentation](../charts/*/README.md)



