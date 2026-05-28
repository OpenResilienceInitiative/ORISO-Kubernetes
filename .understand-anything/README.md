# ORISO-Kubernetes Understand-Anything Notes

> Scope: generated from ORISO-Kubernetes only. Parent folders and sibling repositories were not analyzed.

## Navigation

- [Knowledge graph](knowledge-graph.json)
- [Kubernetes architecture](ARCHITECTURE.md)
- [DevOps/backend onboarding](ONBOARDING.md)
- [ORISO ecosystem integration](ORISO-ECOSYSTEM.md)
- [Findings and risk register](FINDINGS.md)
- [Configuration and dependency audit](DEPENDENCY-AUDIT.md)
- Visuals: [platform topology](visuals/platform-topology.mmd), [ingress traffic](visuals/ingress-traffic-flow.mmd), [Helm phases](visuals/helm-phases.mmd), [service communication](visuals/service-communication.mmd), [observability](visuals/observability-flow.mmd), [local/staging deploy](visuals/deploy-flow.mmd)

## Dashboard

Knowledge graph saved at: /Users/nikunjchampakbhairohit/Developer/freelance/Germany/Oriso-frank-client/ORISO/ORISO-Kubernetes/.understand-anything/knowledge-graph.json

Open the dashboard with:

```bash
cd /Users/nikunjchampakbhairohit/.understand-anything/repo/understand-anything-plugin/packages/dashboard && GRAPH_DIR="/Users/nikunjchampakbhairohit/Developer/freelance/Germany/Oriso-frank-client/ORISO/ORISO-Kubernetes" pnpm exec vite --host 127.0.0.1
```

Then open the local URL printed by Vite.

## Quick Map

ORISO-Kubernetes owns the platform deployment layer. Helm deploys the application and infrastructure workloads, while `ingress/` contains standalone nginx/cert-manager ingress resources that are applied separately.

- Namespace: primarily `caritas`; local macOS override uses `oriso-local`.
- Helm umbrella chart: `helm/oriso-platform` with 24 local subchart dependencies.
- Infrastructure: MariaDB, MongoDB, Redis, RabbitMQ, ClickHouse.
- Auth/communication: Keycloak, Matrix Synapse, Element, Element Call, LiveKit.
- Backend: TenantService, UserService, AgencyService, ConsultingTypeService.
- Frontend/utilities: Frontend, Admin, Health Dashboard, Status Page, Storybook, Redis Commander.
- Observability: SigNoz, OTEL Collector, Redis Exporter, Service Health Exporter.

## Graph Stats

- Files scanned: 165
- Graph nodes: 339
- Graph edges: 588
- Layers: 8
- Helm dependencies/charts: 24
- Ingress resources parsed: 36
- Ingress files parsed: 21
- External hosts parsed: 13

## Critical Files

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
