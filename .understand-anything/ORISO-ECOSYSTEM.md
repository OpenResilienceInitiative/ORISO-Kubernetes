# ORISO Ecosystem Integration

## Navigation

- [Platform role](#platform-role)
- [Application services](#application-services)
- [Identity and communication](#identity-and-communication)
- [Data platform](#data-platform)
- [Frontend/admin traffic](#frontendadmin-traffic)
- [Operations](#operations)

## Platform Role

ORISO-Kubernetes is the deployment surface for the larger ORISO platform. Application repositories provide images and runtime code; this repository composes those images into a running cluster with shared infrastructure and ingress.

## Application Services

- TenantService, UserService, AgencyService, and ConsultingTypeService are deployed as backend ClusterIP services.
- Frontend and Admin are deployed as web workloads and exposed through subdomain ingress.
- UploadService is referenced by ingress, but no UploadService chart is present in this repository.

## Identity and Communication

Keycloak provides authentication and JWT validation. Matrix Synapse, Element, Element Call, and LiveKit support chat and call flows. Backend services store external IDs and call these systems through service DNS and configured external domains.

## Data Platform

MariaDB, MongoDB, Redis, and RabbitMQ are deployed in-cluster. ORISO-Database owns schemas/backups separately; these charts focus on runtime deployment, secrets, services, and storage.

## Frontend/Admin Traffic

Frontend and Admin call public API/auth/matrix URLs. Ingress routes API prefixes on `api.oriso-dev.site` and separate domains for app/admin/auth/matrix/call/livekit/utility UIs.

## Operations

SigNoz, ClickHouse, OTEL Collector, Redis Exporter, Service Health Exporter, Health Dashboard, and Status Page provide operational visibility. CI/CD is not defined here; deploys are documented as manual Helm and kubectl commands.
