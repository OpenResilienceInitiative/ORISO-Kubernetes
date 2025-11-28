# ORISO Kubernetes Configuration Architecture

**Version**: 3.0.0  
**Last Updated**: November 28, 2025  
**Status**: Production Ready

---

## 📋 Overview

This document explains the configuration architecture of the ORISO Kubernetes deployment, demonstrating how it follows standard Kubernetes best practices for environment-agnostic, portable deployments.

---

## 🎯 Core Principles

### 1. **No Hardcoded Values**
- ✅ All application configuration uses Kubernetes ConfigMaps
- ✅ All services reference each other via Kubernetes DNS service names
- ✅ No IP addresses, hostnames, or environment-specific paths in deployment files
- ✅ Configuration is externalized and can be updated without rebuilding images

### 2. **Kubernetes Native DNS**
- ✅ Services use short DNS names (e.g., `mariadb:3306`) within the same namespace
- ✅ No full FQDN required (`mariadb.caritas.svc.cluster.local` is unnecessary)
- ✅ Automatic service discovery via Kubernetes internal DNS
- ✅ Works identically across all environments (dev, staging, production)

### 3. **Configuration Separation**
- ✅ **ConfigMaps**: Non-sensitive application configuration
- ✅ **Deployment Files**: Only contain resource definitions, no configuration values
- ✅ **Environment-Specific**: Each environment has its own ConfigMap values
- ✅ **Version Controlled**: Deployment files are generic and portable

---

## 🏗️ Architecture

### Configuration Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    Kubernetes Cluster                        │
│                                                              │
│  ┌──────────────┐      ┌──────────────┐                   │
│  │  ConfigMaps  │──────│  Deployments  │                   │
│  │  (Non-Sensitive)     │  (Generic)    │                   │
│  └──────────────┘      └──────────────┘                   │
│         │                      │                            │
│         │                      │                            │
│         └──────────┬───────────┘                            │
│                    │                                         │
│                    ▼                                         │
│         ┌─────────────────────┐                             │
│         │   Pod Containers     │                             │
│         │  (Environment Vars)  │                             │
│         └─────────────────────┘                             │
│                    │                                         │
│                    ▼                                         │
│         ┌─────────────────────┐                             │
│         │  Kubernetes DNS     │                             │
│         │  (Service Discovery) │                             │
│         └─────────────────────┘                             │
└─────────────────────────────────────────────────────────────┘
```

### Example: Service Communication

**❌ Wrong Approach (Hardcoded):**
```yaml
env:
  - name: SPRING_DATASOURCE_URL
    value: "jdbc:mariadb://192.168.1.100:3306/tenantservice"  # ❌ IP address
  - name: KEYCLOAK_AUTH_SERVER_URL
    value: "http://keycloak.example.com:8080"  # ❌ External hostname
```

**✅ Correct Approach (Kubernetes Native):**
```yaml
envFrom:
  - configMapRef:
      name: tenantservice-config  # ✅ From ConfigMap
```

**ConfigMap (`tenantservice-config.yaml`):**
```yaml
data:
  SPRING_DATASOURCE_URL: "jdbc:mariadb://mariadb:3306/tenantservice"  # ✅ Service name
  KEYCLOAK_AUTH_SERVER_URL: "http://keycloak:8080"  # ✅ Service name
```

---

## 📁 Configuration Structure

### ConfigMaps Directory

```
configmaps/
├── nginx-config.yaml                    # Nginx proxy configuration
└── services/
    ├── tenantservice-config.yaml        # TenantService configuration
    ├── userservice-config.yaml          # UserService configuration
    ├── agencyservice-config.yaml        # AgencyService configuration
    ├── consultingtypeservice-config.yaml # ConsultingTypeService configuration
    ├── uploadservice-config.yaml        # UploadService configuration
    └── videoservice-config.yaml         # VideoService configuration
```

### Example ConfigMap

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: tenantservice-config
  namespace: caritas
data:
  # Database - Uses Kubernetes service name
  SPRING_DATASOURCE_URL: "jdbc:mariadb://mariadb:3306/tenantservice"
  
  # Keycloak - Uses Kubernetes service name
  KEYCLOAK_AUTH_SERVER_URL: "http://keycloak:8080"
  KEYCLOAK_REALM: "online-beratung"
  
  # Service URLs - All use Kubernetes service names
  CONSULTING_TYPE_SERVICE_API_URL: "http://consultingtypeservice:8083"
  USER_SERVICE_API_URL: "http://userservice:8082"
```

**Key Points:**
- ✅ Uses service names (`mariadb`, `keycloak`) not IPs or external hostnames
- ✅ Works in any Kubernetes cluster without modification
- ✅ Environment-specific values are in ConfigMaps, not deployment files

---

## 🔄 Deployment Workflow

### Step 1: Apply Configuration

```bash
# Apply all ConfigMaps
kubectl apply -f configmaps/services/

# Verify
kubectl get configmaps -n caritas
```

### Step 2: Deploy Services

```bash
# Deploy services (they reference ConfigMaps)
kubectl apply -f deployments/04-backend-services.yaml

# Services automatically load configuration from ConfigMaps
```

### Step 3: Update Configuration (No Rebuild Required)

```bash
# Update ConfigMap
kubectl edit configmap tenantservice-config -n caritas

# Restart service to pick up changes
kubectl rollout restart deployment/tenantservice -n caritas
```

**No Docker image rebuild needed!** Configuration changes are applied instantly.

---

## 🌍 Multi-Environment Support

### How It Works

**Same Deployment Files, Different ConfigMaps:**

```
Production Environment:
├── configmaps/production/
│   ├── tenantservice-config.yaml  # Production values
│   └── userservice-config.yaml    # Production values
└── deployments/
    └── 04-backend-services.yaml   # ✅ Same file

Staging Environment:
├── configmaps/staging/
│   ├── tenantservice-config.yaml  # Staging values
│   └── userservice-config.yaml    # Staging values
└── deployments/
    └── 04-backend-services.yaml   # ✅ Same file
```

### Environment-Specific Values

Each environment maintains its own ConfigMaps with environment-specific values:

**Production ConfigMap:**
```yaml
data:
  SPRING_DATASOURCE_URL: "jdbc:mariadb://mariadb:3306/tenantservice"
  KEYCLOAK_AUTH_SERVER_URL: "http://keycloak:8080"
  # Production-specific settings
```

**Staging ConfigMap:**
```yaml
data:
  SPRING_DATASOURCE_URL: "jdbc:mariadb://mariadb:3306/tenantservice"
  KEYCLOAK_AUTH_SERVER_URL: "http://keycloak:8080"
  # Staging-specific settings (e.g., debug logging)
```

**Deployment files remain identical** - only ConfigMaps differ between environments.

---

## 🔍 Service Discovery

### Kubernetes DNS Resolution

All services in the same namespace can reference each other using short names:

```
Service Name          →  Resolves To
─────────────────────────────────────────────
mariadb               →  mariadb.caritas.svc.cluster.local
keycloak              →  keycloak.caritas.svc.cluster.local
tenantservice         →  tenantservice.caritas.svc.cluster.local
userservice           →  userservice.caritas.svc.cluster.local
```

**Benefits:**
- ✅ No need to know cluster IPs or external hostnames
- ✅ Automatic load balancing via Kubernetes Service
- ✅ Works identically in dev, staging, and production
- ✅ No configuration changes needed when services move

---

## 📊 Configuration Management

### Current Implementation

**Backend Services:**
- ✅ All use `envFrom` to load entire ConfigMaps
- ✅ No individual `env` entries with hardcoded values
- ✅ Configuration is centralized in ConfigMaps

**Example Deployment:**
```yaml
spec:
  containers:
  - name: tenantservice
    image: oriso-tenantservice:latest
    envFrom:
    - configMapRef:
        name: tenantservice-config  # ✅ Loads all config
    - secretRef:
        name: tenantservice-secrets  # ✅ Loads all secrets
```

**Infrastructure Services:**
- ✅ Keycloak, RabbitMQ, Redis, MariaDB use environment variables from ConfigMaps
- ✅ No hardcoded credentials in deployment files
- ✅ All configuration externalized

---

## 🚫 What We Avoid

### Anti-Patterns (Not Used)

**❌ Hardcoded IPs:**
```yaml
value: "http://192.168.1.100:8080"  # ❌ Breaks when IP changes
```

**❌ External Hostnames:**
```yaml
value: "http://keycloak.production.example.com:8080"  # ❌ Environment-specific
```

**❌ Full FQDNs (Unnecessary):**
```yaml
value: "jdbc:mariadb://mariadb.caritas.svc.cluster.local:3306/db"  # ❌ Verbose
```

**✅ Correct (Kubernetes Native):**
```yaml
value: "jdbc:mariadb://mariadb:3306/db"  # ✅ Short, works everywhere
```

---

## 🔧 Configuration Updates

### Updating Configuration

**Method 1: Edit ConfigMap**
```bash
kubectl edit configmap tenantservice-config -n caritas
kubectl rollout restart deployment/tenantservice -n caritas
```

**Method 2: Apply Updated YAML**
```bash
# Edit configmaps/services/tenantservice-config.yaml
kubectl apply -f configmaps/services/tenantservice-config.yaml
kubectl rollout restart deployment/tenantservice -n caritas
```

**Method 3: Patch ConfigMap**
```bash
kubectl patch configmap tenantservice-config -n caritas \
  --type merge -p '{"data":{"NEW_VAR":"value"}}'
kubectl rollout restart deployment/tenantservice -n caritas
```

**No image rebuild required!** Configuration is injected at runtime.

---

## 📈 Benefits

### 1. **Portability**
- ✅ Same deployment files work in any Kubernetes cluster
- ✅ No environment-specific modifications needed
- ✅ Easy to replicate across dev, staging, production

### 2. **Maintainability**
- ✅ Configuration centralized in ConfigMaps
- ✅ Easy to update without rebuilding images
- ✅ Clear separation of concerns

### 3. **Scalability**
- ✅ Add new environments by creating new ConfigMaps
- ✅ No changes to deployment files
- ✅ Supports multiple clusters with different configurations

### 4. **Standard Practice**
- ✅ Follows Kubernetes best practices
- ✅ Aligns with 12-factor app principles
- ✅ Industry-standard approach

---

## 🎓 Comparison with Alternative Approaches

### Alternative: Hardcoded Values in Deployment Files

**❌ Problems:**
- Requires editing deployment files for each environment
- Hundreds of values to manually adjust
- Error-prone (easy to miss values)
- Not scalable (new environment = new deployment files)
- Violates DRY principle

**Example:**
```yaml
# ❌ Would need separate files for each environment
deployments/production/04-backend-services.yaml
deployments/staging/04-backend-services.yaml
deployments/dev/04-backend-services.yaml
# Each with hundreds of different values
```

### Our Approach: ConfigMaps + Kubernetes DNS

**✅ Advantages:**
- Single set of deployment files (DRY)
- Environment-specific values in ConfigMaps only
- No code changes needed for new environments
- Follows Kubernetes standard practices
- Scales to any number of environments

---

## 📝 Configuration Checklist

When deploying to a new environment:

- [ ] Create environment-specific ConfigMaps
- [ ] Update service URLs if needed (usually not required - uses DNS)
- [ ] Apply ConfigMaps: `kubectl apply -f configmaps/services/`
- [ ] Deploy services: `kubectl apply -f deployments/`
- [ ] Verify: `kubectl get pods -n caritas`

**No changes to deployment files required!**

---

## 🔗 Related Documentation

- **[README.md](README.md)** - Main deployment guide
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Detailed deployment procedures
- **[BUILD_GUIDE.md](BUILD_GUIDE.md)** - Building Docker images
- **[configmaps/services/README.md](configmaps/services/README.md)** - ConfigMap documentation

---

## ✅ Summary

The ORISO Kubernetes configuration architecture:

1. **Uses Kubernetes ConfigMaps** for all application configuration
2. **Leverages Kubernetes DNS** for service discovery (no hardcoded IPs/hostnames)
3. **Separates configuration from code** (deployment files are generic)
4. **Supports multiple environments** without duplicating deployment files
5. **Follows Kubernetes best practices** and industry standards
6. **Enables easy updates** without rebuilding Docker images
7. **Scales to any number of environments** with minimal overhead

This approach ensures that the ORISO platform can be deployed to any Kubernetes cluster (dev, staging, production, gridscale, etc.) with only environment-specific ConfigMap values, while keeping deployment files completely generic and portable.

---

**Last Updated**: November 28, 2025  
**Maintainer**: ORISO Platform Team  
**Version**: 3.0.0

