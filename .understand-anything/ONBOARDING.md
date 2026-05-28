# ORISO-Kubernetes Onboarding

## Navigation

- [First hour](#first-hour)
- [Local deployment](#local-deployment)
- [Staging deployment](#staging-deployment)
- [Operational checks](#operational-checks)
- [Backend developer notes](#backend-developer-notes)
- [Change checklist](#change-checklist)

## First Hour

Read in this order:

1. `helm/oriso-platform/Chart.yaml` - Umbrella chart with 24 local dependencies and enable conditions.
2. `helm/oriso-platform/values.yaml` - Primary enabled-service matrix and global dev-domain/service DNS configuration.
3. `helm/values.yaml` - Shared global values for domains, CORS, Keycloak, Matrix, service DNS, database DNS, and defaults.
4. `ingress/README.md` - Ingress operating model, route groups, TLS, CORS, and troubleshooting.
5. `ingress/02-userservice-ingress.yaml` - Five UserService API ingress resources and rewrites.
6. `ingress/05-tenantservice-ingress.yaml` - TenantService public/admin/mock/numeric route split.
7. `helm/charts/keycloak/templates/deployment.yaml` - Keycloak workload template using start-dev and hostNetwork when enabled.
8. `helm/charts/userservice/templates/configmap.yaml` - Large UserService application.properties ConfigMap with service URLs and sensitive-value risk.
9. `helm/charts/mariadb/templates/statefulset.yaml` - MariaDB StatefulSet, probes, resources, PVC template, and retention behavior.
10. `helm/charts/service-health-exporter/templates/configmap.yaml` - Inline Python health exporter sent to OTEL/SigNoz; contains runtime/exporter risk.

Then open the graph tour and inspect layers: Helm Charts, Ingress Routing, Service Communication, Storage, Observability, Environments and Rollout, Operational Risks.

## Local Deployment

Prerequisites: local Kubernetes cluster, Helm 3, kubectl, nginx ingress if testing ingress, storage class, and local images for charts with `pullPolicy: Never`.

```bash
cd /Users/nikunjchampakbhairohit/Developer/freelance/Germany/Oriso-frank-client/ORISO/ORISO-Kubernetes/helm
helm dependency update oriso-platform
helm upgrade --install oriso-platform ./oriso-platform \
  --namespace oriso-local \
  --create-namespace \
  -f values.yaml \
  -f oriso-platform/values-local-macos.example.yaml
```

If you deploy ingress locally, adjust DNS/hosts or ingress controller routing for the `*.oriso.localhost` domains first.

## Staging Deployment

Create a real staging values file rather than editing `helm/values.yaml` directly:

```bash
cd /Users/nikunjchampakbhairohit/Developer/freelance/Germany/Oriso-frank-client/ORISO/ORISO-Kubernetes/helm
helm dependency update oriso-platform
helm upgrade --install oriso-platform ./oriso-platform \
  --namespace caritas \
  --create-namespace \
  -f values.yaml \
  -f values-staging.yaml

cd ../ingress
kubectl apply -f .
```

Required external secrets should be created before deploying. Use real values, not committed defaults:

```bash
kubectl create namespace caritas
kubectl create secret generic mariadb-secrets -n caritas --from-literal=MYSQL_ROOT_PASSWORD='<value>' --from-literal=MYSQL_DATABASE='<value>'
kubectl create secret generic redis-secret -n caritas --from-literal=password='<value>'
kubectl create secret generic rabbitmq-secrets -n caritas --from-literal=RABBITMQ_DEFAULT_USER='<value>' --from-literal=RABBITMQ_DEFAULT_PASS='<value>'
```

## Operational Checks

```bash
kubectl get pods -n caritas
kubectl get svc -n caritas
kubectl get ingress -n caritas
kubectl get certificate -n caritas
helm status oriso-platform -n caritas
kubectl rollout status deployment/oriso-platform-userservice -n caritas
```

Use `kubectl describe pod` for scheduling/probe failures and `kubectl logs deployment/<name> -n caritas --tail=100` for runtime failures.

## Backend Developer Notes

- Use internal DNS (`oriso-platform-*.caritas.svc.cluster.local`) for service-to-service calls.
- Do not call public ingress URLs from backend services unless explicitly required.
- Match backend ports to chart values: TenantService 8081, UserService 8082, ConsultingTypeService 8083, AgencyService 8084.
- Application DB schemas are managed by ORISO-Database; Helm values set Liquibase disabled.
- JWT issuer/JWK URLs must match Keycloak external issuer settings.

## Change Checklist

- Does this change belong in the Helm chart, ingress manifest, or both?
- Does the service have requests/limits and liveness/readiness probes?
- Does the image use an immutable tag and pull policy appropriate for the target cluster?
- Does any credential remain in values files or ConfigMaps?
- Does ingress backend service name match an actual Helm-rendered service?
- Does a stateful workload need backup, PVC retention, or multi-node storage notes?
- Does the change require a staging/prod values overlay?
