# AgencyService Helm Chart

Helm chart for deploying ORISO AgencyService to Kubernetes.

## Overview

This chart deploys AgencyService with all required resources:
- **Deployment** - Application deployment with health probes
- **Service** - ClusterIP service for internal access
- **ConfigMap** - Non-sensitive configuration
- **Secret** - Sensitive credentials (passwords, tokens)

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- MariaDB deployed and accessible at `mariadb:3306`
- MongoDB deployed and accessible at `mongodb:27017`
- Keycloak deployed and accessible at `keycloak:8080`
- Matrix Synapse deployed and accessible at `matrix-synapse:8008` (optional)
- RocketChat deployed and accessible at `rocketchat:3000` (optional)

## Installation

### Install from local chart

```bash
cd caritas-workspace/ORISO-Kubernetes/helm/charts/agencyservice
helm install agencyservice . \
  --namespace caritas \
  --create-namespace
```

### Install with custom values

```bash
helm install agencyservice . \
  --namespace caritas \
  --create-namespace \
  -f my-values.yaml
```

## Configuration

All configuration values are in `values.yaml`. Key sections:

### Database Configuration
- **MariaDB:** Connection URL, username, password
- **MongoDB:** Connection URI

### Keycloak Configuration
- Auth server URL, realm, JWT issuer/JWKS URIs
- Admin credentials

### Service URLs
- All internal service URLs use Kubernetes DNS (e.g., `http://consultingtypeservice:8083`)
- No hardcoded IPs - fully compatible with managed Kubernetes clusters

### Feature Flags
- Topics, demographics, appointments, multitenancy

## Values Reference

See `values.yaml` for complete list of configurable values. All values match the current production deployment to ensure compatibility.

**Important:** All values in `values.yaml` are set to match the current working deployment. Changing them may require corresponding changes to the application code.

## Upgrading

```bash
helm upgrade agencyservice . \
  --namespace caritas
```

## Uninstalling

```bash
helm uninstall agencyservice --namespace caritas
```

## Verification

After installation, verify the deployment:

```bash
# Check deployment status
kubectl get deployment agencyservice -n caritas

# Check pods
kubectl get pods -n caritas -l app=agencyservice

# Check service
kubectl get service agencyservice -n caritas

# Check ConfigMap
kubectl get configmap agencyservice-config -n caritas

# Check logs
kubectl logs -n caritas -l app=agencyservice --tail=50
```

## Notes

- **Database schemas** are managed separately in `ORISO-Database` repository
- **Liquibase is disabled** (`spring.liquibase.enabled=false`)
- **All service URLs** use Kubernetes DNS for internal communication
- **Secrets** should be managed via external secret management in production
- **Image pull policy** is set to `Never` for local k3s images - change to `IfNotPresent` or `Always` for production

## Current Values

All values in `values.yaml` match the current production deployment:
- ConfigMap values match `configmaps/services/agencyservice-config.yaml`
- Secret values match `secrets/services/agencyservice-secrets.yaml`
- Deployment spec matches `deployments/04-backend-services.yaml`

This ensures zero downtime when migrating from direct YAML deployment to Helm.
