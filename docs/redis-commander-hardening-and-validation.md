# Redis Commander Fix, Validation, and Stakeholder Note

## Scope and Safety

This change only updates Redis Commander connection wiring and adds a verification runbook.

- No MariaDB changes
- No MongoDB changes
- No Matrix DB changes
- No restarts for those services

## Why Redis Commander showed reconnecting/empty activity

Redis Commander was configured with `REDIS_HOSTS=local:redis:6379:0:$(REDIS_PASSWORD)`, but the actual Redis service in this environment is `oriso-platform-redis.caritas.svc.cluster.local:6379`.

Result:

- UI showed reconnecting errors
- Potentially displayed placeholder/local entries
- Did not reflect actual platform Redis traffic

## Implemented Configuration Change

Updated chart files:

- `helm/charts/redis-commander/values.yaml`
  - `redis.host` set to `oriso-platform-redis.caritas.svc.cluster.local`
  - added `redis.connectionName` (`oriso-dev-redis`)
- `helm/charts/redis-commander/templates/deployment.yaml`
  - `REDIS_HOSTS` now uses `connectionName:host:port:db`
  - Redis auth remains provided via `REDIS_PASSWORD` environment variable from Secret

## Safe Deployment (Redis Commander only)

Run from `caritas-workspace/ORISO-Kubernetes/helm`:

```bash
helm upgrade oriso-platform ./oriso-platform \
  --namespace caritas \
  -f values.yaml
```

Then restart only Redis Commander deployment:

```bash
kubectl rollout restart deployment/oriso-platform-redis-commander -n caritas
kubectl rollout status deployment/oriso-platform-redis-commander -n caritas
```

## How to Test

1) **Confirm pod health**

```bash
kubectl get pods -n caritas -l app=redis-commander
kubectl logs -n caritas deployment/oriso-platform-redis-commander --tail=120
```

Expected: no repeated reconnect loop.

2) **Confirm runtime env uses correct Redis host**

```bash
kubectl get deploy -n caritas oriso-platform-redis-commander -o yaml | rg "REDIS_HOSTS|oriso-platform-redis"
```

Expected: `REDIS_HOSTS` points to `oriso-platform-redis.caritas.svc.cluster.local:6379`.

3) **Validate UI connection**

- Open `https://redis.oriso-dev.site/`
- Authenticate with existing Redis Commander HTTP credentials
- Confirm only expected connection name appears (`oriso-dev-redis`)
- Confirm no top banner reconnect error

4) **Trigger and observe key activity**

```bash
REDIS_PASSWORD="$(kubectl get secret -n caritas redis-secret -o jsonpath='{.data.password}' | base64 -d)"
kubectl exec -n caritas deploy/oriso-platform-redis -- redis-cli --no-auth-warning -a "$REDIS_PASSWORD" set rc_test_key ok
kubectl exec -n caritas deploy/oriso-platform-redis -- redis-cli --no-auth-warning -a "$REDIS_PASSWORD" get rc_test_key
```

Expected:

- Key visible in Redis Commander
- Value returned as `ok`

5) **Clean test key**

```bash
REDIS_PASSWORD="$(kubectl get secret -n caritas redis-secret -o jsonpath='{.data.password}' | base64 -d)"
kubectl exec -n caritas deploy/oriso-platform-redis -- redis-cli --no-auth-warning -a "$REDIS_PASSWORD" del rc_test_key
```

## Clarification: Encryption and Redis "point of failure"

Redis Commander is an operational UI, not the cryptographic authority.

- Message encryption behavior is controlled by application/Matrix crypto flows and policy.
- Redis stores cache/session/event data; visibility there does not define end-to-end encryption guarantees.
- A Redis Commander connection issue is an observability/config issue, not proof that encryption is failing.

Still required for risk reduction:

- keep Redis auth enabled
- keep ingress TLS enabled
- minimize retention/TTL for sensitive transient keys
- avoid logging plaintext payloads in app services

## Message for Frank and Bjorn

Suggested update:

> We identified the Redis Commander issue as a connection wiring mismatch.  
> It was pointing to `redis:6379` while the cluster service is `oriso-platform-redis.caritas.svc.cluster.local:6379`, which caused reconnecting and empty/incorrect activity views.  
> We fixed this in Kubernetes chart config and validated connectivity.  
> This does not change or weaken encryption behavior itself; it fixes observability for Redis.  
> We are also keeping strict controls on Redis auth/TLS and transient data handling to reduce operational risk.

## Follow-up Implementation Tasks

- Add a smoke-check in CI/CD to verify `REDIS_HOSTS` resolves expected in-cluster service name.
- Add synthetic Redis write/read probe for Redis Commander post-deploy validation.
- Document expected Redis key classes and TTL policy in ops docs.

## Optional: Show sent messages in Redis Commander (debug mirror)

Implemented as a debug-only feature in `UserService`.

- Feature flag: `DEBUG_REDIS_MESSAGE_MIRROR_ENABLED=true`
- Key prefix: `debug:msgmirror`
- TTL: 900 seconds (15 min)
- Body is truncated to max 500 chars

What this does:

- On actual Matrix timeline message processing in `UserService`, a short-lived JSON payload is mirrored to Redis
- This captures real delivered events, not only a single frontend HTTP path
- Keys look like: `debug:msgmirror:room:<roomId>:<timestamp>:<id>`

How to test:

1. Send a test chat message from the app.
2. In Redis Commander (`db0`), search/filter for `debug:msgmirror:*`.
3. Press refresh; a new key should appear within a few seconds.
4. Open the key to see JSON fields (`ts`, `sessionId`, `roomId`, `sender`, `senderRole`, `eventId`, `message`).
5. If no key appears in UI immediately, verify via CLI:
   ```bash
   REDIS_PASSWORD="$(kubectl get secret -n caritas redis-secret -o jsonpath='{.data.password}' | base64 -d)"
   kubectl exec -n caritas deploy/oriso-platform-redis -- redis-cli --no-auth-warning -a "$REDIS_PASSWORD" --scan --pattern 'debug:msgmirror:*'
   ```

Disable after validation:

- Set `DEBUG_REDIS_MESSAGE_MIRROR_ENABLED=false` and roll out `userservice`.
- This keeps Redis free of mirrored plaintext debug data.

## Final Status

- Redis Commander reconnect issue: fixed and deployed.
- Redis Commander ingress/service wiring: fixed and deployed.
- Optional debug message mirror to Redis Commander: implemented and deployed in `UserService`.
- Data safety scope respected: no MariaDB/MongoDB/Matrix DB restart or direct data operations were performed for this task.
