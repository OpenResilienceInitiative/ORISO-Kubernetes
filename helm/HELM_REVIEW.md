# ORISO Helm Charts — Review (Phase 1: Findings only)

Scope: `helm/oriso-platform` (umbrella) + 25 subcharts under `helm/charts/*`.
Focus per your ask: every value that should come from `values.yaml` (or umbrella `global.*` / subchart values) but is currently baked into a template, plus the structural problems that will block a clean parameterised release.

This document only lists findings and recommendations. No changes have been made to any chart.

---

## 1. Cross-cutting issues (apply to most subcharts)

These show up in nearly every chart and should be fixed once via a convention, not patched chart by chart.

### 1.1 `namespace: caritas` hardcoded as default in every subchart `values.yaml`
Every subchart's `values.yaml` defaults `namespace: caritas`, and every template uses `namespace: {{ .Values.namespace }}`. There is no fall-through to `.Values.global.namespace` or `.Release.Namespace`. Result: if anyone installs the umbrella without explicitly setting `<subchart>.namespace`, everything lands in `caritas` regardless of what `global.namespace` says.

Recommendation: replace `namespace: {{ .Values.namespace }}` with `namespace: {{ .Values.global.namespace | default .Release.Namespace }}` (umbrella already exposes `global.namespace`). Drop the per-chart `namespace:` value or keep it only as an override.

### 1.2 `selector.matchLabels: app: <name>` hardcoded in templates
Affected: `mariadb`, `mongodb`, `redis`, `rabbitmq`, `keycloak`, `matrix-synapse`, `element`, `element-call`, `clickhouse`, `livekit` (both deployments), `redis-commander`, `redis-exporter`, `health-dashboard`, `status-page`, `storybook`, `frontend`, `admin`, `service-health-exporter`, `otel-collector`.

These charts already define a `selectorLabels` helper in `_helpers.tpl` (the backend services use it correctly). The infra/UI charts should do the same — otherwise the selector becomes immutable across two releases with the same chart, and any rename breaks the deployment.

### 1.3 Image registry / pull policy / repo not honouring `global.imageRegistry`
The umbrella `values.yaml` exposes `global.imageRegistry` and there is a `oriso-platform.image` helper in the umbrella's `_helpers.tpl`, but **no subchart template uses it**. Every deployment renders `"{{ .Values.image.repository }}:{{ .Values.image.tag }}"` directly, ignoring the global registry.

Recommendation: add a per-chart `image` helper (`{{- include "<chart>.image" . }}`) that prepends `.Values.global.imageRegistry` when set, and use it everywhere. Same for `imagePullSecrets` (currently nothing in any chart consumes `global.imagePullSecrets`).

### 1.4 `containerPort` hardcoded as numeric literal
Found in:

* `userservice/templates/deployment.yaml:25` — `containerPort: 8082`
* `tenantservice/templates/deployment.yaml:25` — `containerPort: 8081`
* `agencyservice/templates/deployment.yaml:25` — `containerPort: 8084`
* `consultingtypeservice/templates/deployment.yaml:25` — `containerPort: 8083`
* `admin/templates/deployment.yaml:32` — `containerPort: 80`
* `frontend/templates/deployment.yaml:30` — `containerPort: 80`
* `signoz/templates/statefulset.yaml:89,92` — `containerPort: 4317`, `4318` (otel-grpc / otel-http) — these aren't in `.Values.service.*` at all.

These should all be `{{ .Values.service.targetPort }}` (or a named port from a values list). The two SigNoz OTLP ports should be added to `values.yaml` as part of `service.ports`.

### 1.5 `revisionHistoryLimit`, `strategy`, `terminationGracePeriodSeconds`, `terminationMessagePath/Policy` hardcoded
Every deployment file repeats:

```yaml
revisionHistoryLimit: 10
strategy: { type: RollingUpdate, rollingUpdate: { maxSurge: 25%, maxUnavailable: 25% } }
terminationGracePeriodSeconds: 30
terminationMessagePath: /dev/termination-log
terminationMessagePolicy: File
```

None of those are wired to values. They should either be moved to a shared helper or exposed as `deployment.strategy`, `deployment.revisionHistoryLimit`, `terminationGracePeriodSeconds` in each chart's `values.yaml`.

### 1.6 Plaintext credentials in `values.yaml`
Many subchart `values.yaml` files contain real-looking passwords:

* `userservice/values.yaml`: `database.password: "userservice"`, `keycloak.config.adminPassword: "technical"`, `matrix.adminPassword: "@CaritasAdmin2025!"`, `matrix.registrationSharedSecret: "caritas-registration-secret-2025"`, `rabbitmq.username/password: "admin"/"admin"`, `rocketchat.technical.password: "technical"`.
* `tenantservice/values.yaml`: same pattern (`tenantservice/tenantservice`, `admin/admin`).
* `agencyservice/values.yaml`: same.
* `consultingtypeservice/values.yaml`: same.
* `keycloak/values.yaml`: `keycloak.admin.password: "admin"`.
* `mariadb/values.yaml`: `database.rootPassword: "root"`.
* `clickhouse/values.yaml`: `clickhouse.password: "clickhouse-password"`.

These should be empty strings by default (or removed). Real values belong in:

1. The umbrella `bootstrapSecrets` block (already exists in `values-prod.yaml`, see §3.4), or
2. ExternalSecret refs via `global.externalSecrets`, or
3. `existingSecret` references with `secretKeyRef`.

The chart deployments should ONLY read credentials via `secretKeyRef`, never via `value:`. Currently `keycloak/templates/deployment.yaml` does `value: {{ .Values.keycloak.admin.password | quote }}` for `KEYCLOAK_ADMIN_PASSWORD` — that ends up in plaintext in the rendered Deployment.

### 1.7 Hardcoded `oriso-platform-<x>.caritas.svc.cluster.local` FQDNs in every backend service's `values.yaml`
`userservice`, `tenantservice`, `agencyservice`, `consultingtypeservice`, `service-health-exporter`, `otel-collector`, `redis-commander`, `signoz` all hardcode service FQDNs that bake in two assumptions:

1. The Helm release name is `oriso-platform`.
2. The namespace is `caritas`.

Change either and every backend breaks at boot. These should be derived in the template, e.g.:

```yaml
url: {{ printf "http://%s-mariadb.%s.svc.cluster.local:3306/userservice"
        .Release.Name (include "<chart>.namespace" .) }}
```

…or, more cleanly, defined once on the umbrella as `global.services.<name>.url` and consumed by the subcharts via the existing `if .Values.global.services... else .Values...` ladder (the configmaps already do this for some keys — generalise it to **all** internal URLs and drop the chart-level defaults).

### 1.8 Hardcoded application config inside ConfigMap templates
`userservice/templates/configmap.yaml` (and to a lesser extent the other backend configmaps) embed an entire `application.properties` blob with hardcoded values:

* Tomcat thread pool sizes (`server.tomcat.threads.max=1000`, `min-spare=500`, `max-connections=5000`, etc.).
* Locale `de_DE`, timezone `Europe/Berlin`.
* Hardcoded fallback FQDN `oriso-platform-userservice.caritas.svc.cluster.local:8082`.
* Hardcoded CORS path list `/service/users/askers/new,/service/users/consultants/languages`.

These should all be promoted to `values.yaml` under e.g. `app.server.tomcat`, `app.locale`, `app.cors.paths`. Otherwise tuning the userservice for load requires editing the chart instead of a values override.

### 1.9 ConfigMaps and Secrets fully hardcoded
`oriso-platform/templates/configmaps/redis-config.yaml` is fully literal — `bind`, `protected-mode`, `appendonly` are hardcoded with no values reference. Move to `redis.config: {...}` and `toYaml` it into the ConfigMap.

`consultingtypeservice/templates/secret.yaml` lines 15–16 hardcode `"technical"/"technical"` directly in the template (not even via values). That's a straight values bypass.

### 1.10 `tier: backend` / `tier: frontend` labels hardcoded in templates
`userservice`, `tenantservice`, `agencyservice`, `consultingtypeservice` deployment.yaml pod templates set `tier: backend` literally; `admin/templates/deployment.yaml` sets `tier: frontend`. These should be in a `podLabels` map in values, or in the shared labels helper.

### 1.11 External ConfigMap / Secret refs that the chart does not own
* `redis/templates/deployment.yaml` mounts `redis-config` ConfigMap (controlled by `configMap.existing: true`); that ConfigMap is generated by `oriso-platform/templates/configmaps/redis-config.yaml`. OK by design, but undocumented — call this out in the chart README.
* `matrix-synapse` mounts `matrix-homeserver-oidc` — **this ConfigMap is not created anywhere in the repo.** It must exist out-of-band. Either ship it as a template (with `homeserver.yaml` parameterised via values) or add a `helm.sh/hook` precondition.
* `element-call/templates/deployment.yaml` mounts a `configMap: element-call-config` that has no corresponding template in `helm/charts/element-call/templates/`. Same problem — install will fail until that ConfigMap exists.
* `userservice/templates/deployment.yaml` references `name: redis-secret, key: password` via `secretKeyRef` — that Secret is created by the umbrella `bootstrap-secrets.yaml` only if `bootstrapSecrets.enabled` is true. The subchart should either declare the dependency explicitly or fall back to its own `redis.secret` value.

---

## 2. Umbrella chart (`helm/oriso-platform/`)

### 2.1 `bootstrapSecrets` and `bootstrapPvc` keys are referenced by templates but not defined in default `values.yaml`
`templates/secrets/bootstrap-secrets.yaml` uses `.Values.bootstrapSecrets.*`, and `templates/pvc/bootstrap-pvc.yaml` uses `.Values.bootstrapPvc.*`. Neither key exists in `values.yaml`. They only appear in `values-prod.yaml`. Consequence: `helm install oriso-platform helm/oriso-platform` with no `-f` will either skip everything (because `.Values.bootstrapSecrets.enabled` is nil/false) or, if someone sets `bootstrapSecrets.enabled: true` ad-hoc, render empty `stringData` and fail.

Fix: add the full `bootstrapSecrets` and `bootstrapPvc` skeleton to the default `values.yaml` with `enabled: false` and the sub-keys at empty strings, so users see them in `helm show values` and templates render safely.

### 2.2 Duplicate / overwritten `admin` and `frontend` blocks in `services:`
`values.yaml` lines 219–251: under `services.admin` the keys `resources`, `autoscaling`, `probes`, `env`, `secret` are declared twice, and the last block writes `existingSecret: frontend-secret` into the `admin` map. YAML keeps the last value, so `admin` ends up pointing at `frontend-secret` and `services.frontend` ends up missing `resources`/`probes`/`secret` entirely. This is a copy-paste bug.

### 2.3 Two parallel configuration trees that can drift
The umbrella exposes:

* `<subchart>:` blocks (e.g. `userservice:`, `frontend:`) — consumed by the subchart itself for image/replicas/probes.
* `services.<name>:` blocks — consumed by the umbrella's own `ingress.yaml`, `services-env.yaml`, `hpa.yaml`, `external-secret.yaml`.

Both blocks carry an `image:` key, and in `values-prod.yaml` they diverge (`frontend.image.repository = oriso-frontend` in subchart key, `services.frontend.image.repository = oriso-frontend`/`caritas-frontend` in services key). The subchart `image` is the one that's actually used by the running pod; the `services.<name>.image` is dead weight. Decide on one tree.

### 2.4 `oriso-platform.image` helper exists but is unused
`templates/_helpers.tpl` defines `oriso-platform.image` that respects `global.imageRegistry`. Nothing calls it. Subcharts don't have access to it anyway (umbrella named templates aren't visible to subcharts). Replicate this helper into each subchart's `_helpers.tpl` and use it from the deployments. (See §1.3.)

### 2.5 `_helpers.tpl` has no `selectorLabels` definition
Only `oriso-platform.labels` is defined, and it doesn't include `app.kubernetes.io/name` consistently with the subcharts. The umbrella's own `ingress.yaml` / `services-env.yaml` add `app.kubernetes.io/name: {{ $name }}` inline, which is fine, but a shared `oriso-platform.selectorLabels` helper would keep selectors and labels in lockstep.

### 2.6 `redis-config.yaml` ConfigMap is unconditional
It always renders, even if `redis.enabled: false`. Wrap with `{{- if .Values.redis.enabled }}`.

### 2.7 `bootstrap-pvc.yaml` claim names are hardcoded
`mongodb-storage`, `redis-pvc`, `matrix-synapse-data` are literal strings; the subcharts (mongodb, redis, matrix-synapse) each have `persistence.existingClaim: "mongodb-storage"` etc. — also literal. Tie these together: either expose `global.persistence.<svc>.claimName` and use it in both the PVC and the subcharts, or have the PVC names derive from `{{ .Release.Name }}-<svc>`.

### 2.8 `Chart.yaml` dependency versions are all `"1.0.0"`
Every dependency is pinned at `"1.0.0"`, which means `helm dependency update` won't help you when a single subchart actually changes. Bump the subchart version on any change and use a real version range, e.g. `~1.0` or pin to the published version once you publish.

### 2.9 No `Chart.yaml` for any subchart was inspected for `appVersion`/`type`/`maintainers`
(Not blocking but worth a pass for hygiene before tagging.)

---

## 3. Per-subchart highlights

Only items that go beyond §1 / §2.

### mariadb
* `service.yaml` has `clusterIP: None  # Headless service for StatefulSet` set unconditionally; if you ever want a clusterIP service in another env you can't switch it. Move to `service.clusterIP` with `None` as default.
* `persistence.accessMode` and `persistence.storageClass` aren't wrapped in `if`s — chart will fail if `persistence.enabled: true` but `storageClass` is empty.
* Probe commands include `-uroot -proot` hardcoded in `readinessProbe.exec.command` (and even in `values.yaml`!) — credentials leak via probe ps output. Use `mysqladmin ping` with `MYSQL_PWD` env, or read via `valueFrom.secretKeyRef`.

### mongodb
* No probes defined.
* `persistence.accessMode` set in values but volumeClaimTemplate is never used because `existingClaim` is always set to `mongodb-storage`. The "create new PVC" branch is dead code unless `existingClaim` is overridden to `""`.

### redis
* Probes embed `redis-cli -a $REDIS_PASSWORD` — same credentials-in-args issue as mariadb. Use `REDISCLI_AUTH` env or the unix socket.
* Chart owns no `redis.conf` ConfigMap of its own; it depends on the umbrella's `redis-config` (see §1.11).

### rabbitmq
* No probes. No persistence at all (RabbitMQ message data is ephemeral on pod restart). At minimum, add a `persistence` block to `values.yaml` and a PVC mount, even if `enabled: false` by default.

### keycloak
* `args: [start-dev]` hardcoded — that disables production mode. Should be `{{ .Values.keycloak.args | toYaml | nindent 8 }}` with `["start-dev"]` as default.
* `KEYCLOAK_ADMIN_PASSWORD` set as plaintext `value:`, not `valueFrom.secretKeyRef`.
* `hostNetwork: true` default is surprising for an HTTP-only app; this puts Keycloak on the node's network namespace and bypasses CNI. Almost certainly accidental — flip default to `false` and let prod opt in.
* `keycloak.hostname` defaults to `""` which when passed to `KC_HOSTNAME` will produce `value: ""` — verify Keycloak 20 accepts that.

### matrix-synapse
* `image.tag: latest` + `pullPolicy: Always` — non-deterministic deploys. Pin a version.
* `securityContext` is set at the pod level; the init container sets `runAsUser: 0`. That fights the pod-level `runAsUser: 991`. Should be set per container, or use a `fsGroup` only and drop the init container.
* `homeserver.yaml` mount expects an external ConfigMap (`matrix-homeserver-oidc`) that this repo doesn't ship. Ship it.

### element-call
* Pod mounts `element-call-config` ConfigMap that doesn't exist in this chart. Ship it (see §1.11).

### livekit
* No probes for either deployment. LiveKit needs UDP ports for media; service only exposes TCP 7880. If real WebRTC traffic is expected, you need a separate Service with `type: LoadBalancer` and the RTC port range plus `protocol: UDP`.
* No values for LiveKit API key / secret; the token service can't sign without them. Either out-of-band Secret or `livekit.keys` in values.

### clickhouse
* Probes are hardcoded in the template (not in values). Move them.
* `maxMemoryUsage: 10000000000` etc. are in values but never referenced by the template — dead config.
* No XML config volume; ClickHouse defaults will be used (probably fine for dev, not for SigNoz storage at scale).

### signoz
* Multiple `containerPort` literals (4317, 4318) not in values (see §1.4).
* OTLP receivers should be wired to `.Values.service.ports.*` and exposed via the Service (the Service template doesn't include OTLP ports at all — verify).
* `clickhouse.host: "oriso-platform-clickhouse"` is hardcoded with the release name (see §1.7).

### otel-collector
* Receiver `endpoint: 0.0.0.0:4317` / `:4318` is literal in the ConfigMap template. Use `{{ .Values.service.ports.otlpGrpc }}` etc.
* Liveness/readiness probes hardcoded in template (not values).

### service-health-exporter
* Anti-pattern: container runs `pip install ...` at startup. Bake the deps into a custom image. As-is, the chart depends on the cluster having outbound internet at pod-start, and adds 30–60s of latency to every restart.
* `configmap.yaml` has a typo bug: imports `OTLPMetricExporter` but instantiates `OTLPHTTPMetricExporter` — runtime `NameError`.
* Services to monitor are hardcoded as FQDNs (see §1.7).

### redis-commander
* `redis.host` hardcoded FQDN with release name (see §1.7). Should be `{{ printf "%s-redis" .Release.Name }}` or pulled from `global.services.redis.host`.
* Service file hardcodes `selector: app: redis-commander`.

### redis-exporter
* `redis.addr: "redis:6379"` — wrong, should be the full service name (this would resolve to a hostname `redis` which doesn't exist with the release-prefix convention).

### status-page
* Service `type: LoadBalancer` by default — that allocates a cloud LB. Almost always wrong for an internal status page; default should be `ClusterIP` (or `NodePort`) with LB opt-in.
* `STATUS_*` env wired off `global.*` keys that don't appear in the umbrella `values.yaml` (`global.services.frontend.url`, `global.services.admin.url`, `global.services.livekit.url`, `global.matrix.internalUrl`, `global.keycloak.internalUrl`). Define these in the umbrella so the conditionals fire.

### frontend / admin
* Both default `service.type: LoadBalancer` — same comment as status-page.
* Both hardcode `selector: app: frontend` / `app: admin` (not the helper).
* `containerPort: 80` hardcoded (see §1.4).

### health-dashboard, storybook
* `containerPort` actually uses `.Values.service.targetPort` — these two are the best-behaved charts.
* No probes for health-dashboard (ironic).

### userservice / tenantservice / agencyservice / consultingtypeservice
* All four share the same issues from §1.4 (hardcoded `containerPort`), §1.6 (plaintext creds in values), §1.7 (hardcoded FQDNs), §1.8 (hardcoded Spring config in configmap), §1.10 (`tier: backend`).
* `userservice/templates/deployment.yaml` hardcodes the redis secret name `redis-secret` for the `SPRING_REDIS_PASSWORD` env — should be `.Values.redis.secret.name`.
* `consultingtypeservice/templates/secret.yaml` hardcodes `"technical"/"technical"` for `KEYCLOAK_CONFIG_ADMIN_USERNAME`/`PASSWORD` directly in the template (bypasses values entirely).
* `agencyservice/templates/deployment.yaml` is the only one of the four that doesn't gate `resources`/`livenessProbe`/`readinessProbe` with `{{ if }}` — if any of those is unset in values it will render an invalid empty map.

---

## 4. Recommended order of fixes (when you're ready for the execution phase)

1. **Umbrella `values.yaml`**: add `bootstrapSecrets` + `bootstrapPvc` skeletons; fix duplicate `admin`/`frontend` blocks; decide subchart-vs-`services.*` tree.
2. **Conventions**: add `<chart>.image`, `<chart>.namespace`, `<chart>.selectorLabels` helpers to every subchart's `_helpers.tpl`, then replace every literal usage.
3. **Secrets**: remove plaintext passwords from all `values.yaml`; switch every credential env to `valueFrom.secretKeyRef`; document the bootstrap-vs-externalSecret choice.
4. **Hardcoded FQDNs**: replace `oriso-platform-<x>.caritas.svc.cluster.local` strings with `printf` over `.Release.Name` + the namespace helper, OR populate `global.services.<x>.url` and consume that everywhere.
5. **Hardcoded ports**: replace literal `containerPort:` numbers with `{{ .Values.service.targetPort }}` (or named port entries); add SigNoz OTLP ports to its values.
6. **Hardcoded Spring config**: lift `application.properties` literals into `app.*` values in the backend services.
7. **Missing ConfigMaps**: ship `matrix-homeserver-oidc` and `element-call-config` templates.
8. **Probes / strategy / revisionHistoryLimit**: parameterise per chart or extract to a shared helper.
9. **Service types**: default frontend / admin / status-page to `ClusterIP`, opt into `LoadBalancer` via values.
10. **service-health-exporter**: bake deps into a real image; fix `OTLPHTTPMetricExporter` typo.

Once you've signed off on this list (or trimmed it), I can go through chart-by-chart and refactor — keeping each chart's externally-observable resources identical so it's a pure values-extraction with no behaviour change.
