# ORISO Kubernetes Deploy & Restore Runbook

This guide explains how to deploy ORISO with Helm on k3s and restore MariaDB/Mongo backups using placeholder values.

## 1) Prerequisites

- Linux VM with `sudo` access
- `kubectl`, `helm`, `curl`
- ORISO repo checked out locally
- Backup files available for SQL and Mongo restore

Set placeholders (edit before running):

```bash
export REPO_ROOT="<ABSOLUTE_PATH_TO_ORISO-Kubernetes>"
export NAMESPACE="<K8S_NAMESPACE>"              # e.g. caritas
export RELEASE_NAME="<HELM_RELEASE_NAME>"       # e.g. oriso
export BACKUP_DIR="<ABSOLUTE_PATH_TO_BACKUPS>"  # folder containing *.sql and all-mongodb.archive.gz
```

## 2) Install k3s and Helm

```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable traefik" sh -
sudo systemctl status k3s

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
source ~/.bashrc

kubectl get nodes

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

helm version
```

## 3) Install ingress-nginx

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx
```

## 4) Prepare Helm values

```bash
cd "$REPO_ROOT/helm/oriso-platform"
cp values.yaml values.local.yaml
cp secrets-values.yaml secrets-values.local.yaml
```

Update at minimum:

- all default passwords and secrets
- DB/Mongo/Redis/RabbitMQ credentials
- Keycloak admin + client secrets
- ingress hosts/TLS
- image tags / pull policy
- SMTP/external integration credentials

> Important: never commit real secrets into Git.

## 5) Build chart dependencies

```bash
cd "$REPO_ROOT/helm/oriso-platform"
helm dependency update
helm dependency build
```

## 6) Deploy ORISO

```bash
cd "$REPO_ROOT"

helm upgrade --install "$RELEASE_NAME" ./helm/oriso-platform \
  -n "$NAMESPACE" \
  --create-namespace \
  -f ./helm/oriso-platform/values.local.yaml \
  -f ./helm/oriso-platform/secrets-values.local.yaml
```

Verify:

```bash
kubectl get pods -n "$NAMESPACE"
kubectl get svc -n "$NAMESPACE"
kubectl get ingress -n "$NAMESPACE"
```

## 7) Restore MariaDB

### 7.1 Find MariaDB pod

```bash
export MARIADB_POD="$(kubectl get pods -n "$NAMESPACE" --no-headers | awk '/mariadb/ && /Running/ {print $1; exit}')"
echo "$MARIADB_POD"
```

### 7.2 Copy SQL dumps

```bash
kubectl cp "$BACKUP_DIR/agencyservice.sql" "$NAMESPACE/$MARIADB_POD:/tmp/agencyservice.sql"
kubectl cp "$BACKUP_DIR/tenantservice.sql" "$NAMESPACE/$MARIADB_POD:/tmp/tenantservice.sql"
kubectl cp "$BACKUP_DIR/consultingtypeservice.sql" "$NAMESPACE/$MARIADB_POD:/tmp/consultingtypeservice.sql"
kubectl cp "$BACKUP_DIR/userservice.sql" "$NAMESPACE/$MARIADB_POD:/tmp/userservice.sql"
kubectl cp "$BACKUP_DIR/videoservice.sql" "$NAMESPACE/$MARIADB_POD:/tmp/videoservice.sql"
kubectl cp "$BACKUP_DIR/uploadservice.sql" "$NAMESPACE/$MARIADB_POD:/tmp/uploadservice.sql"
```

### 7.3 Create databases/users/grants (template)

```bash
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- sh -lc '
mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" -e "
CREATE DATABASE IF NOT EXISTS <DB_NAME_1>;
CREATE DATABASE IF NOT EXISTS <DB_NAME_2>;
...
CREATE USER IF NOT EXISTS '\''<APP_DB_USER_1>'\''@'\''%'\'' IDENTIFIED BY '\''<APP_DB_PASS_1>'\'';
...
GRANT ALL PRIVILEGES ON <DB_NAME_1>.* TO '\''<APP_DB_USER_1>'\''@'\''%'\'';
...
FLUSH PRIVILEGES;
"
'
```

### 7.4 Import SQL dumps

```bash
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- sh -lc 'mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" < /tmp/agencyservice.sql'
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- sh -lc 'mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" < /tmp/tenantservice.sql'
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- sh -lc 'mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" < /tmp/consultingtypeservice.sql'
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- sh -lc 'mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" < /tmp/userservice.sql'
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- sh -lc 'mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" < /tmp/videoservice.sql'
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- sh -lc 'mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" < /tmp/uploadservice.sql'
```

Validate:

```bash
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" -e "SHOW DATABASES;"
kubectl exec -n "$NAMESPACE" -it "$MARIADB_POD" -- mysql -u<DB_ROOT_USER> -p"$MYSQL_ROOT_PASSWORD" -e "USE <DB_NAME>; SHOW TABLES;"
```

## 8) Restore MongoDB

### 8.1 Find MongoDB pod

```bash
export MONGODB_POD="$(kubectl get pods -n "$NAMESPACE" --no-headers | awk '/mongodb/ && /Running/ {print $1; exit}')"
echo "$MONGODB_POD"
```

### 8.2 Copy and restore archive

```bash
kubectl cp "$BACKUP_DIR/all-mongodb.archive.gz" "$NAMESPACE/$MONGODB_POD:/tmp/all-mongodb.archive.gz"

kubectl exec -n "$NAMESPACE" -it "$MONGODB_POD" -- sh -lc '
gunzip -c /tmp/all-mongodb.archive.gz | mongorestore --archive --drop
'
```

Validate:

```bash
kubectl exec -n "$NAMESPACE" -it "$MONGODB_POD" -- mongosh --eval "show dbs"
kubectl exec -n "$NAMESPACE" -it "$MONGODB_POD" -- mongosh --eval 'db.getSiblingDB("<DB_NAME>").<COLLECTION>.findOne()'
```

## 9) Restart dependent services

```bash
kubectl rollout restart deploy -n "$NAMESPACE"
kubectl get pods -n "$NAMESPACE"
kubectl rollout status deploy -n "$NAMESPACE"
```

## 10) Troubleshooting quick checks

```bash
kubectl get events -n "$NAMESPACE" --sort-by=.metadata.creationTimestamp
kubectl logs -n "$NAMESPACE" deploy/<SERVICE_NAME> --since=10m
kubectl describe pod -n "$NAMESPACE" <POD_NAME>
```

## 11) Security notes

- Rotate all default passwords before first production use.
- Keep secret values in a secure secret manager or encrypted file workflow.
- Do not commit `secrets-values.local.yaml` or raw backup files.

## 12) Keycloak

Keycloak-specific setup is intentionally documented separately in a dedicated README.
