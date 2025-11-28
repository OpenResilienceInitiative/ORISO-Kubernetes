# Service ConfigMaps

This directory contains Kubernetes ConfigMaps for all backend services.

## Usage

Apply all ConfigMaps:
```bash
kubectl apply -f configmaps/services/
```

Apply individual ConfigMap:
```bash
kubectl apply -f configmaps/services/userservice-config.yaml
```

## Important Notes

1. **Use Service Names**: All URLs use Kubernetes service names (e.g., `mariadb:3306`) since all services are in the same namespace
2. **No IPs**: Never use hardcoded IP addresses
3. **No Full DNS**: Short service names are cleaner and more portable
3. **Namespace**: All ConfigMaps are created in the `caritas` namespace
4. **Updates**: After updating a ConfigMap, restart the service: `kubectl rollout restart deployment/SERVICE_NAME -n caritas`

## ConfigMaps

- `userservice-config.yaml` - UserService configuration
- `tenantservice-config.yaml` - TenantService configuration
- `agencyservice-config.yaml` - AgencyService configuration
- `consultingtypeservice-config.yaml` - ConsultingTypeService configuration

