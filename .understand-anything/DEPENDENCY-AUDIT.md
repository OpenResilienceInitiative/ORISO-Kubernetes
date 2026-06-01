# Configuration and Dependency Audit

## Navigation

- [Helm dependencies](#helm-dependencies)
- [Runtime dependencies](#runtime-dependencies)
- [Secrets and configmaps](#secrets-and-configmaps)
- [Ingress dependencies](#ingress-dependencies)
- [Storage dependencies](#storage-dependencies)
- [CI/CD and rollout](#cicd-and-rollout)

## Helm Dependencies

`helm/oriso-platform/Chart.yaml` depends on 24 local file-based subcharts. `helm/oriso-platform/Chart.lock` pins these local dependency versions and digest. Packaged `.tgz` charts exist under `helm/oriso-platform/charts/`, but source charts under `helm/charts/` are the maintainable source.

## Runtime Dependencies

- Backend services depend on MariaDB, Keycloak, and RabbitMQ.
- UserService and AgencyService also depend on MongoDB, Matrix Synapse, and Rocket.Chat-related endpoints.
- ConsultingTypeService depends on MongoDB and TenantService.
- SigNoz depends on ClickHouse.
- OTEL Collector forwards metrics to SigNoz.
- Redis Commander and Redis Exporter depend on Redis.

## Secrets and ConfigMaps

Secret templates exist for backend services, MariaDB, Redis, RabbitMQ, Redis Commander, Redis Exporter, and related charts. However, many credential values are still present as chart values. Treat values files as sensitive until those fields are moved to externally managed Secrets.

## Ingress Dependencies

Ingress requires nginx ingress controller, `ingressClassName: nginx`, cert-manager, `letsencrypt-prod`, DNS records, and backend services already deployed in the target namespace. Ingress is applied separately with kubectl.

## Storage Dependencies

The deployment assumes a storage class named `local-path` and existing PVC names for MongoDB, Redis, and Matrix. This fits k3s/local development but should be reviewed for staging/production recovery, backup, and node migration.

## CI/CD and Rollout

No CI/CD manifests were found. Rollout is documented as manual `helm dependency update`, `helm upgrade --install`, and `kubectl apply -f ingress`. Helm lint passed for the umbrella chart during this analysis, and `helm template` rendered the chart successfully with `helm/values.yaml`.
