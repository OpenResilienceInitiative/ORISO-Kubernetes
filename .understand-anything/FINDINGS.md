# Findings and Risk Register

## Navigation

- [High impact](#high-impact)
- [Security](#security)
- [Reliability and scaling](#reliability-and-scaling)
- [Ingress and networking](#ingress-and-networking)
- [Environment drift](#environment-drift)
- [Operational bottlenecks](#operational-bottlenecks)
- [Duplicated logic](#duplicated-logic)

## High Impact

1. Keycloak is configured with `start-dev`, `hostNetwork: true`, no resource defaults, and no probes in `helm/charts/keycloak`.
2. Credential fields are committed in values files and rendered into Secret templates; some password-like fields also appear in ConfigMaps, especially `helm/charts/userservice/templates/configmap.yaml`.
3. No HPA, NetworkPolicy, or PodDisruptionBudget manifests were found.
4. `ingress/08-uploadservice-ingress.yaml` routes to `oriso-platform-uploadservice`, but no UploadService chart exists in `helm/charts` or the umbrella chart.
5. `ingress/11-rocketchat-ingress.yaml` routes to `rocketchat`, and backend values reference Rocket.Chat URLs, but no Rocket.Chat chart exists in this repo.
6. Several application charts use `latest` image tags and `pullPolicy: Never`, making deployment dependent on node-local images.

## Security

- Utility UIs are publicly routable: Redis Commander, SigNoz, Storybook, Health Dashboard, and Status Page.
- CORS annotations commonly allow `$http_origin` with credentials. This needs strict ingress-controller validation and origin policy review.
- No NetworkPolicy manifests define east-west traffic boundaries.
- Values include Keycloak, Matrix, database, RabbitMQ, Rocket.Chat, SMTP, and service credential fields. Move these to external Secrets or a secret manager.
- Some ConfigMaps render sensitive application properties, which weakens Secret separation.

## Reliability and Scaling

- Most workloads run with `replicas: 1`.
- `userservice`, `tenantservice`, and `consultingtypeservice` have empty resources and empty probes.
- `mongodb`, `rabbitmq`, `redis-exporter`, `health-dashboard`, `status-page`, and `livekit` have missing or empty probes/resources in values.
- No HPA is present for API services, frontends, or ingress-heavy utility services.
- No PDB protects stateful or critical services during node drains.
- Local-path storage is risky for production multi-node recovery.

## Ingress and Networking

- Ingress resources are standalone, not part of the Helm release. Helm deploy success does not mean external routes exist.
- Several ingress files contain committed `kubectl.kubernetes.io/last-applied-configuration` annotations, including stale backend service names without the `oriso-platform-` prefix.
- The ingress README says 33 ingress resources, but this scan parsed 36 Ingress documents.
- `frontend`, `admin`, and `status-page` use `LoadBalancer` service types while separate ingress resources expose them.
- UploadService and Rocket.Chat ingress routes are not backed by charts in this repo.

## Environment Drift

- `helm/values.yaml` and `helm/oriso-platform/values.yaml` duplicate global domains, service URLs, Matrix, Keycloak, and database settings.
- Documentation mentions `values-prod.yaml`/environment files, but no committed staging/prod overlay exists.
- Local macOS override uses `oriso-local` and HTTP localhost-style domains, while main values use `caritas` and HTTPS `oriso-dev.site` domains.
- Backend Spring profiles are mixed: UserService and ConsultingTypeService use `prod`, while AgencyService and TenantService use `local` in chart values.

## Operational Bottlenecks

- `service-health-exporter` installs Python packages at container startup and its inline script references `OTLPHTTPMetricExporter`, which is not imported.
- Helm dependencies are local and packaged; source and packaged charts can drift if `helm dependency update` is not run consistently.
- No CI/CD pipeline definitions were found, so deployment validation is manual unless handled outside this repository.
- Keycloak `hostNetwork` can create port conflicts and weakens pod network isolation.

## Duplicated Logic

- Ingress CORS snippets and rewrite annotations are repeated across many manifests.
- Global values are duplicated between `helm/values.yaml` and `helm/oriso-platform/values.yaml`.
- Service DNS and domain values appear in both global values and individual chart values.
- Some ingress files carry both real manifest configuration and the older last-applied JSON annotation.
