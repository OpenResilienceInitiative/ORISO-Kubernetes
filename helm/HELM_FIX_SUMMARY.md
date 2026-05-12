# Helm chart fixes — summary

All hardcoded URLs/hostnames have been moved out of the subcharts and into
`oriso-platform/values-prod.yaml`. Change a hostname in one place and the
whole stack follows.

## What was wrong

1. **Hardcoded URLs in every subchart** – `userservice`, `tenantservice`,
   `agencyservice`, `consultingtypeservice`, `redis-commander`,
   `redis-exporter`, `signoz`, `otel-collector`, `service-health-exporter`
   all had `oriso-platform-*.caritas.svc.cluster.local` baked into their
   `values.yaml`. Renaming the Helm release or namespace would break
   every service.

2. **Hardcoded namespace `caritas`** in 24 subchart `values.yaml` files
   and 59 templates. The chart was unusable in any other namespace.

3. **Frontend/Admin URLs would render blank** in production. The templates
   read `.Values.global.domains.api/app/matrix/...` but `values-prod.yaml`
   never defined them. The SPA would boot and immediately fail every
   API call.

4. **Keycloak helper crashed on render** – `_helpers.tpl` line 55 did
   `if .Values.global.domains.auth` with no nil-guard.

5. **redis-exporter pointed at the wrong host** – `redis:6379` doesn't
   resolve; the actual service is named `oriso-platform-redis`.

6. **Credentials rendered into a ConfigMap** in userservice – passwords
   readable by any pod in the namespace.

7. **Plaintext passwords in values-prod.yaml** – `Expertflow123`, `admin/admin`.

8. **Broken image tags** – `tag: rebuild` doesn't exist in your registry.
   Your CI workflow only publishes `latest` + sha + branch tags. Pods
   only worked because images were pre-pulled on k3s nodes.

## What I fixed

- Rewrote `oriso-platform/values-prod.yaml` with three big new sections:
  - `global.domains` – every public hostname (api, app, admin, auth,
    matrix, call, livekit, storybook, status)
  - `global.services` – every in-cluster URL (mariadb, mongodb, redis,
    rabbitmq, signoz, otel-collector, clickhouse, plus each backend
    service URL and port)
  - `global.matrix` and `global.keycloak` – realm + internal URL +
    public URL + JWT issuer/JWK URIs
- Rewrote every backend service ConfigMap (`userservice`,
  `tenantservice`, `agencyservice`, `consultingtypeservice`) so URLs are
  derived from `.Values.global.*` with the chart's own `values.yaml`
  acting only as a fallback. The subchart values now have *empty* URLs.
- Removed every `*.svc.cluster.local` literal from subchart `values.yaml`
  files (verified with `grep` – 0 remain).
- Changed every `namespace: caritas` literal to `namespace: ""`. Templates
  now compute `namespace: {{ default .Release.Namespace .Values.namespace }}`
  in 59 templates.
- Fixed the keycloak `_helpers.tpl` nil-pointer.
- Fixed `redis-exporter` so the address is derived from
  `global.services.redis.host:port` with proper fallback.
- Moved credentials out of the userservice ConfigMap. The Spring
  `application.properties` blob now uses `${ENV_VAR:}` interpolation;
  the real values come from the existing Secret via `envFrom`.
- Replaced plaintext passwords in `bootstrapSecrets` with
  `CHANGE_ME_*` placeholders and added comments pointing at external
  secrets / `--set` / git-ignored secret files.
- Made the umbrella `ingress.yaml` merge `global.ingress.annotations`
  (cert-manager, ssl-redirect, proxy-body-size) into every ingress.
- Enabled HPA defaults in `values-prod.yaml` for the 5 stateless services.

## What you still need to do

1. **Replace `CHANGE_ME_*` placeholders** in `bootstrapSecrets`, or
   better: set `externalSecrets.enabled: true` and store real
   credentials in your vault (External Secrets Operator / Sealed
   Secrets / SOPS). Do **not** commit real passwords to git.

2. **Pin image tags.** Search `values-prod.yaml` for `# NOTE: pin` and
   `tag: latest` / `tag: rebuild` and replace with real SHAs your CI
   publishes. Your CI currently publishes `latest`, branch name, and
   sha tags – never `rebuild`. Suggest using sha for prod deploys.

3. **Storage class.** `storageClass: local-path` is k3s-only. On
   AKS/EKS/GKE use `managed-csi` / `gp3` / `standard-rwo`.

4. **Ship missing ConfigMaps** the chart references but doesn't ship:
   - `element-call-config` (referenced by `charts/element-call/templates/deployment.yaml`)
   - `matrix-homeserver-oidc` (referenced by `charts/matrix-synapse/templates/deployment.yaml`)

5. **Run `helm lint` and `helm template -f values-prod.yaml`** locally
   to verify rendering. The sandbox doesn't have Helm installed so I
   couldn't run it for you.

## Files changed

- `helm/oriso-platform/values-prod.yaml` (rewritten)
- `helm/oriso-platform/templates/ingress.yaml` (merged annotations)
- `helm/charts/keycloak/templates/_helpers.tpl` (nil-guard)
- `helm/charts/userservice/values.yaml` (cleared URLs/creds)
- `helm/charts/userservice/templates/configmap.yaml` (rewritten – no creds, uses globals)
- `helm/charts/userservice/templates/deployment.yaml` (namespace fallback)
- `helm/charts/userservice/templates/secret.yaml` (namespace fallback)
- `helm/charts/tenantservice/values.yaml` (cleared URLs/creds)
- `helm/charts/tenantservice/templates/configmap.yaml` (rewritten)
- `helm/charts/tenantservice/templates/deployment.yaml` (namespace fallback)
- `helm/charts/tenantservice/templates/secret.yaml` (namespace + RabbitMQ creds moved here)
- `helm/charts/agencyservice/values.yaml` (cleared URLs/creds)
- `helm/charts/agencyservice/templates/configmap.yaml` (rewritten)
- `helm/charts/agencyservice/templates/deployment.yaml` (namespace + probe nil-guards)
- `helm/charts/agencyservice/templates/service.yaml` (namespace fallback)
- `helm/charts/agencyservice/templates/secret.yaml` (namespace fallback)
- `helm/charts/consultingtypeservice/values.yaml` (cleared URLs/creds)
- `helm/charts/consultingtypeservice/templates/configmap.yaml` (rewritten)
- `helm/charts/consultingtypeservice/templates/deployment.yaml` (namespace fallback)
- `helm/charts/consultingtypeservice/templates/secret.yaml` (namespace + RabbitMQ creds)
- `helm/charts/redis-exporter/values.yaml` (cleared `redis.addr`)
- `helm/charts/redis-exporter/templates/deployment.yaml` (derives addr from globals)
- `helm/charts/redis-commander/values.yaml` (cleared `redis.host`)
- `helm/charts/redis-commander/templates/deployment.yaml` (derives host from globals)
- `helm/charts/signoz/values.yaml` (cleared `clickhouse.host`, `signozExternalUrl`)
- `helm/charts/signoz/templates/statefulset.yaml` (derives clickhouse host + external url)
- `helm/charts/otel-collector/values.yaml` (cleared signoz endpoint)
- `helm/charts/otel-collector/templates/configmap.yaml` (derives endpoint from globals)
- `helm/charts/service-health-exporter/values.yaml` (cleared all URLs)
- `helm/charts/service-health-exporter/templates/configmap.yaml` (derives URLs from globals)
- `helm/charts/storybook/values.yaml` (`pullPolicy: Never` → `IfNotPresent`)
- Bulk: `namespace: caritas` → `namespace: ""` in 24 subchart values
- Bulk: `namespace: {{ .Values.namespace }}` → `namespace: {{ default .Release.Namespace .Values.namespace }}` in 59 templates
