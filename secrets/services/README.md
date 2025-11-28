# Service Secrets

This directory contains Kubernetes Secrets for all backend services.

## Usage

Apply all Secrets:
```bash
kubectl apply -f secrets/services/
```

Apply individual Secret:
```bash
kubectl apply -f secrets/services/userservice-secrets.yaml
```

## Important Notes

1. **Sensitive Data**: These files contain passwords, tokens, and other sensitive information
2. **Security**: Consider using sealed-secrets or external secret management for production
3. **Updates**: After updating a Secret, restart the service: `kubectl rollout restart deployment/SERVICE_NAME -n caritas`
4. **Base64**: Secrets are stored as base64-encoded strings in Kubernetes

## Secrets

- `userservice-secrets.yaml` - UserService credentials
- `tenantservice-secrets.yaml` - TenantService credentials
- `agencyservice-secrets.yaml` - AgencyService credentials
- `consultingtypeservice-secrets.yaml` - ConsultingTypeService credentials

## Viewing Secrets

```bash
# View secret (values are base64 encoded)
kubectl get secret userservice-secrets -n caritas -o yaml

# Decode a specific value
kubectl get secret userservice-secrets -n caritas -o jsonpath="{.data.SPRING_DATASOURCE_PASSWORD}" | base64 -d
```

