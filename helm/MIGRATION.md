# Migration Guide: Shell Scripts → Helm Charts

This guide explains how to migrate from shell scripts to Helm charts.

## Problem Statement

Previously, SQL init scripts were in `ORISO-Database/mariadb/` and applied via shell scripts. This caused issues:
- ❌ Updating SQL files broke deployments
- ❌ Manual script execution required
- ❌ No version control for deployed schemas
- ❌ Inconsistent deployment process

## Solution: Helm Charts

SQL schemas are now embedded in Helm charts:
- ✅ Schemas versioned with Helm chart
- ✅ Automatic application via Helm hooks
- ✅ `helm upgrade` applies latest schemas
- ✅ Consistent, repeatable deployments

## Migration Steps

### 1. Update SQL Schemas

When SQL files in `ORISO-Database/mariadb/` are updated:

```bash
# Copy updated schemas to Helm chart
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes/helm/charts/mariadb

# Copy all schemas
cp ../../../ORISO-Database/mariadb/*/schema.sql sql-schemas/

# Rename to match chart naming
for db in agencyservice consultingtypeservice tenantservice userservice videoservice uploadservice caritas; do
  mv sql-schemas/schema.sql sql-schemas/${db}-schema.sql
done
```

### 2. Upgrade Helm Release

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes/helm

# Upgrade MariaDB chart (applies new schemas)
helm upgrade mariadb ./charts/mariadb --namespace caritas
```

### 3. Verify

```bash
# Check init job completed
kubectl get jobs -n caritas | grep mariadb-init

# Verify databases
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -proot -e "SHOW DATABASES;"
```

## Workflow Comparison

### Old Workflow (Shell Scripts)

```bash
# 1. Update SQL in ORISO-Database
vim ORISO-Database/mariadb/tenantservice/schema.sql

# 2. Run setup script
cd ORISO-Database
./scripts/setup/01-mariadb-setup.sh
./scripts/setup/02-apply-mariadb-schemas.sh

# 3. Hope it works
```

### New Workflow (Helm)

```bash
# 1. Update SQL in ORISO-Database
vim ORISO-Database/mariadb/tenantservice/schema.sql

# 2. Copy to Helm chart (or automate this)
cp ORISO-Database/mariadb/tenantservice/schema.sql \
   ORISO-Kubernetes/helm/charts/mariadb/sql-schemas/tenantservice-schema.sql

# 3. Upgrade Helm release
cd ORISO-Kubernetes/helm
helm upgrade mariadb ./charts/mariadb --namespace caritas

# 4. Done! Helm handles everything
```

## Automation (Future)

Consider automating schema sync:

```bash
# Script: sync-schemas.sh
#!/bin/bash
cd "$(dirname "$0")"
for db in agencyservice consultingtypeservice tenantservice userservice videoservice uploadservice caritas; do
  cp "../../ORISO-Database/mariadb/$db/schema.sql" \
     "charts/mariadb/templates/init-scripts/${db}-schema.sql"
done
echo "✓ Schemas synced. Run: helm upgrade mariadb ./charts/mariadb --namespace caritas"
```

## Rollback

If something goes wrong:

```bash
# Rollback Helm release
helm rollback mariadb --namespace caritas

# Or check previous revisions
helm history mariadb --namespace caritas
```

## Benefits Summary

| Aspect | Shell Scripts | Helm Charts |
|--------|--------------|-------------|
| Version Control | Separate repo | In chart |
| Deployment | Manual execution | `helm install/upgrade` |
| Updates | Manual script run | `helm upgrade` |
| Rollback | Manual restore | `helm rollback` |
| Consistency | Varies by env | Same everywhere |
| Production Ready | ❌ | ✅ |

