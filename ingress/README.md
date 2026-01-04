# Kubernetes Ingress Resources for ORISO Platform

Complete Kubernetes-native Ingress configuration for API gateway functionality.

## 📋 Prerequisites

### Required Components

1. **Nginx Ingress Controller**
   ```bash
   kubectl get ingressclass nginx
   kubectl get pods -n ingress-nginx
   
   # Install if missing:
   helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
   helm install ingress-nginx ingress-nginx/ingress-nginx \
     --namespace ingress-nginx \
     --create-namespace
   ```

2. **Cert-Manager** (for TLS certificates)
   ```bash
   kubectl get clusterissuer letsencrypt-prod
   
   # Install if missing:
   kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml
   ```

3. **Namespace**
   ```bash
   kubectl get namespace caritas
   # Create if missing: kubectl create namespace caritas
   ```

4. **All Services Deployed** (services must exist before Ingress)
   ```bash
   kubectl get svc -n caritas
   ```

5. **DNS Records** (point to Ingress Controller IP)
   - `api.oriso-dev.site` → Ingress Controller IP
   - `app.oriso-dev.site` → Ingress Controller IP
   - `admin.oriso-dev.site` → Ingress Controller IP
   - `auth.oriso-dev.site` → Ingress Controller IP
   - And other subdomains as needed

## 🚀 Quick Start

### Deploy All Ingress Resources

```bash
cd caritas-workspace/ORISO-Kubernetes/ingress
kubectl apply -f .
```

### Deploy Individual Ingress

```bash
kubectl apply -f 01-keycloak-ingress.yaml
kubectl apply -f 02-userservice-ingress.yaml
```

### Verify Deployment

```bash
# Check all Ingress resources
kubectl get ingress -n caritas

# Check specific Ingress
kubectl describe ingress keycloak-ingress -n caritas

# Check TLS certificates
kubectl get certificate -n caritas
```

## 📁 File Structure

### API Ingress (api.oriso-dev.site)

- `00-keycloak-auth-domain-ingress.yaml` - Keycloak on auth.oriso-dev.site
- `01-keycloak-ingress.yaml` - Keycloak authentication routes
- `02-userservice-ingress.yaml` - UserService routes (5 Ingress resources)
- `03-agencyservice-ingress.yaml` - AgencyService routes (4 Ingress resources)
- `04-consultingtypeservice-ingress.yaml` - ConsultingTypeService routes (5 Ingress resources)
- `05-tenantservice-ingress.yaml` - TenantService routes (3 Ingress resources)
- `06-matrix-ingress.yaml` - Matrix Synapse media routes
- `08-uploadservice-ingress.yaml` - UploadService routes
- `10-health-ingress.yaml` - Health Dashboard routes
- `11-rocketchat-ingress.yaml` - RocketChat API routes
- `12-matrix-domain-ingress.yaml` - Matrix client domain

### Subdomain Ingress (Separate Domains)

- `13-frontend-ingress.yaml` - Frontend (app.oriso-dev.site)
- `14-admin-ingress.yaml` - Admin Panel (admin.oriso-dev.site)
- `15-health-dashboard-ingress.yaml` - Health Dashboard (health.oriso-dev.site)
- `16-element-ingress.yaml` - Element.io (element.oriso-dev.site)
- `17-element-call-ingress.yaml` - Element Call (call.oriso-dev.site)
- `18-livekit-ingress.yaml` - LiveKit WebRTC (livekit.oriso-dev.site)
- `19-redis-commander-ingress.yaml` - Redis Commander (redis.oriso-dev.site)
- `20-signoz-ingress.yaml` - SigNoz Observability (signoz.oriso-dev.site)
- `21-status-page-ingress.yaml` - Status Page (status.oriso-dev.site)
- `22-storybook-ingress.yaml` - Storybook UI Dev (storybook.oriso-dev.site)

**Total:** 22 YAML files containing 33 Ingress resources

## 🔧 Configuration

### Service Names

All Ingress resources use services with `oriso-platform-` prefix:

- `oriso-platform-userservice` (port 8082)
- `oriso-platform-agencyservice` (port 8084)
- `oriso-platform-consultingtypeservice` (port 8083)
- `oriso-platform-tenantservice` (port 8081)
- `oriso-platform-uploadservice` (port 8085)
- And others...

### Path Rewrite Rules

Ingress uses regex capture groups for path rewriting:

```yaml
path: /service/users(/|$)(.*)
pathType: ImplementationSpecific
nginx.ingress.kubernetes.io/rewrite-target: /users/$2
nginx.ingress.kubernetes.io/use-regex: "true"
```

**Examples:**
- `/service/users/foo` → `/users/foo`
- `/service/users` → `/users`

### CORS Configuration

All routes support CORS with dynamic origin:

```yaml
nginx.ingress.kubernetes.io/enable-cors: "true"
nginx.ingress.kubernetes.io/cors-allow-origin: "$http_origin"
nginx.ingress.kubernetes.io/cors-allow-methods: "GET, POST, PUT, PATCH, DELETE, OPTIONS"
nginx.ingress.kubernetes.io/cors-allow-credentials: "true"
```

### TLS/SSL Configuration

All Ingress resources have TLS enabled with Let's Encrypt:

```yaml
annotations:
  cert-manager.io/cluster-issuer: "letsencrypt-prod"
  nginx.ingress.kubernetes.io/ssl-redirect: "true"
spec:
  tls:
  - hosts:
    - api.oriso-dev.site
    secretName: api-oriso-dev-site-tls
```

Certificates are automatically issued and renewed by cert-manager.

## 🧪 Testing

### Test Routes

```bash
# Test Keycloak
curl -I https://api.oriso-dev.site/auth/realms/online-beratung/.well-known/openid-configuration

# Test UserService
curl -I https://api.oriso-dev.site/service/users/data

# Test AgencyService (public endpoint)
curl https://api.oriso-dev.site/service/agencies/190
```

### Verify Ingress Status

```bash
# Check all Ingress resources
kubectl get ingress -n caritas

# Check specific Ingress
kubectl describe ingress keycloak-ingress -n caritas

# Check Ingress controller logs
kubectl logs -n ingress-nginx -l app.kubernetes.io/component=controller --tail=50

# Check TLS certificates
kubectl get certificate -n caritas
```

## 🐛 Troubleshooting

### Routes Not Working

1. **Check Ingress Controller:**
   ```bash
   kubectl get pods -n ingress-nginx
   kubectl logs -n ingress-nginx -l app.kubernetes.io/component=controller --tail=100
   ```

2. **Check Ingress Status:**
   ```bash
   kubectl describe ingress <ingress-name> -n caritas
   # Look for "Events" section for errors
   ```

3. **Check Backend Services:**
   ```bash
   kubectl get svc -n caritas
   kubectl get endpoints -n caritas
   kubectl get pods -n caritas | grep <service-name>
   ```

### CORS Errors

1. **Verify CORS annotations:**
   ```bash
   kubectl get ingress <ingress-name> -n caritas -o yaml | grep cors
   ```

2. **Test OPTIONS request:**
   ```bash
   curl -X OPTIONS https://api.oriso-dev.site/<path> \
     -H "Origin: https://app.oriso-dev.site" \
     -H "Access-Control-Request-Method: GET" \
     -v
   ```

### TLS/Certificate Issues

1. **Check cert-manager:**
   ```bash
   kubectl get pods -n cert-manager
   kubectl get clusterissuer letsencrypt-prod
   ```

2. **Check certificate status:**
   ```bash
   kubectl get certificate -n caritas
   kubectl describe certificate <cert-name> -n caritas
   ```

## 📝 Notes

### Internal Service Communication

**✅ Correct (Kubernetes DNS):**
- Services communicate via: `servicename.caritas.svc.cluster.local:port`
- Example: `oriso-platform-userservice.caritas.svc.cluster.local:8082`
- No public internet routing for internal traffic

**❌ Incorrect (Public URLs - should be avoided):**
- `https://api.oriso-dev.site/service/*` (only for external clients)

### Domain Configuration

All Ingress resources use:
- **API Domain:** `api.oriso-dev.site`
- **Auth Domain:** `auth.oriso-dev.site`
- **Matrix Domain:** `matrix.oriso-dev.site`

To change domains, update the `host` field in each Ingress resource's `rules` section.

## 📚 Related Documentation

- [Helm Charts](../helm/README.md)
- [Main Kubernetes README](../README.md)
