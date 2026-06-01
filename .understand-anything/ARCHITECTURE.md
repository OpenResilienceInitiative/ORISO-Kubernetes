# ORISO-Kubernetes Architecture

## Navigation

- [Responsibility](#responsibility)
- [Deployment topology](#deployment-topology)
- [Helm structure](#helm-structure)
- [Traffic flow](#traffic-flow)
- [Service communication](#service-communication)
- [Secrets and config](#secrets-and-config)
- [Storage](#storage)
- [Scaling and rollout](#scaling-and-rollout)
- [Monitoring](#monitoring)
- [Environment overlays](#environment-overlays)

## Responsibility

This repository is the Kubernetes deployment and operations layer for ORISO. It does not contain application source code; it defines how ORISO services, infrastructure, ingress, storage, and observability are deployed and connected.

## Deployment Topology

The normal target namespace is `caritas`. Services are named with the Helm release prefix, for example `oriso-platform-userservice`, and internal communication uses full Kubernetes DNS names under `caritas.svc.cluster.local`.

Deployment groups:

- Infrastructure: `mariadb`, `mongodb`, `redis`, `rabbitmq`, `clickhouse`.
- Authentication and communication: `keycloak`, `matrix-synapse`, `element`, `element-call`, `livekit`.
- Backend services: `tenantservice`, `userservice`, `agencyservice`, `consultingtypeservice`.
- Frontend and utilities: `frontend`, `admin`, `health-dashboard`, `status-page`, `storybook`, `redis-commander`.
- Observability: `signoz`, `otel-collector`, `redis-exporter`, `service-health-exporter`.

## Helm Structure

- `helm/oriso-platform/Chart.yaml` is the umbrella chart and declares 24 local subchart dependencies.
- `helm/oriso-platform/values.yaml` enables/disables services and duplicates global domain/service values.
- `helm/values.yaml` contains shared global values for domains, Keycloak, Matrix, CORS, database hosts, and service URLs.
- `helm/charts/*/values.yaml` contains service-specific image, replica, resource, probe, service, database, auth, and integration values.
- `helm/oriso-platform/charts/*.tgz` contains packaged chart dependencies; these were ignored for graph content because their source charts exist in `helm/charts/`.

## Traffic Flow

Ingress is outside the umbrella chart. Deployment is a two-step operation:

1. Deploy/upgrade Helm release from `helm/oriso-platform`.
2. Apply `ingress/*.yaml` after services exist.

External routing uses:

- `api.oriso-dev.site` for backend API path prefixes such as `/service/users`, `/service/agencies`, `/service/tenant`, `/service/consultingtypes`, Matrix media, and health routes.
- `auth.oriso-dev.site` for Keycloak direct auth-domain access.
- `app.oriso-dev.site` and `admin.oriso-dev.site` for frontend/admin.
- `matrix.oriso-dev.site`, `call.oriso-dev.site`, and `livekit.oriso-dev.site` for Matrix/video flows.
- Utility subdomains for Redis Commander, SigNoz, Status Page, Storybook, and Health Dashboard.

## Service Communication

Backend service communication should stay inside the cluster:

- UserService depends on MariaDB, MongoDB, Keycloak, Matrix Synapse, RabbitMQ, TenantService, AgencyService, and ConsultingTypeService.
- AgencyService depends on MariaDB, MongoDB, Keycloak, Matrix Synapse, TenantService, UserService, ConsultingTypeService, and Rocket.Chat-related URLs.
- TenantService depends on MariaDB, Keycloak, RabbitMQ, UserService, and ConsultingTypeService.
- ConsultingTypeService depends on MariaDB, MongoDB, Keycloak, RabbitMQ, and TenantService.

## Secrets and Config

There are Secret templates for backend services, but many values are still supplied from committed values files. Some ConfigMaps also render password-like properties into `application.properties`. Production should move credentials to externally managed Kubernetes Secrets or a secret manager and keep ConfigMaps non-sensitive.

## Storage

- MariaDB: StatefulSet with `10Gi` local-path PVC template.
- ClickHouse: StatefulSet with `50Gi` local-path PVC template.
- SigNoz: StatefulSet with `20Gi` local-path PVC template.
- Redis: Deployment using existing `redis-pvc`.
- MongoDB: Deployment using existing `mongodb-storage` PVC.
- Matrix Synapse: Deployment using existing `matrix-synapse-data` PVC.

The current storage style fits a simple k3s/local-path setup. For production, local-path creates node-affinity and recovery constraints.

## Scaling and Rollout

Most workloads are configured with one replica. No `HorizontalPodAutoscaler`, `PodDisruptionBudget`, or `NetworkPolicy` manifests were found. Most Deployment templates use RollingUpdate with `maxSurge: 25%` and `maxUnavailable: 25%`. StatefulSets rely on their StatefulSet update behavior.

## Monitoring

The monitoring path is: `service-health-exporter` polls backend actuator health endpoints, exports metrics to `otel-collector`, and the collector forwards to `signoz`, which stores telemetry through `clickhouse`. Redis metrics are handled by `redis-exporter`. Health Dashboard and Status Page are user-facing operational UIs.

## Environment Overlays

Committed environment files are limited. `helm/oriso-platform/values-local-macos.example.yaml` provides a local example using `oriso-local` and localhost domains. There is no committed `values-staging.yaml` or `values-prod.yaml`; docs mention creating them.
