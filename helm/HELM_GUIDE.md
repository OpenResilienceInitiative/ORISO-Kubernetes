# ORISO Helm Charts - Complete Guide

## Overview

This directory contains Helm charts for deploying the ORISO platform. Helm charts replace shell scripts with proper Kubernetes-native deployment management.

## Quick Start

### 1. Sync SQL Schemas

Before deploying, sync the latest SQL schemas from `ORISO-Database`:

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes/helm
./sync-schemas.sh
```

### 2. Install MariaDB

```bash
# Install MariaDB with init scripts
helm install mariadb ./charts/mariadb \
  --namespace caritas \
  --create-namespace \
  --set secrets.rootPassword=your-secure-password
```

### 3. Verify

```bash
# Check MariaDB pod
kubectl get pods -n caritas | grep mariadb

# Check init job
kubectl get jobs -n caritas | grep mariadb-init

# View init job logs
kubectl logs -n caritas job/mariadb-init-databases

# Verify databases created
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -proot -e "SHOW DATABASES;"
```

## Updating SQL Schemas

When SQL files in `ORISO-Database/mariadb/` are updated:

```bash
# 1. Sync schemas to Helm chart
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes/helm
./sync-schemas.sh

# 2. Upgrade Helm release (applies new schemas)
helm upgrade mariadb ./charts/mariadb --namespace caritas

# 3. Verify
kubectl logs -n caritas job/mariadb-init-databases
```

## Chart Structure

```
helm/
├── Chart.yaml                 # Main umbrella chart
├── values.yaml                # Global values
├── sync-schemas.sh           # Script to sync SQL from ORISO-Database
├── charts/                   # Sub-charts
│   └── mariadb/              # MariaDB chart
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── templates/
│       │   ├── configmap-schemas.yaml    # ConfigMaps for SQL schemas
│       │   ├── job-init-databases.yaml   # Init Job (Helm hook)
│       │   ├── statefulset.yaml          # MariaDB StatefulSet
│       │   └── service.yaml              # MariaDB Service
│       └── sql-schemas/                  # SQL schema files (not in templates/)
│           ├── agencyservice-schema.sql
│           ├── tenantservice-schema.sql
│           └── ...
└── README.md
```

## How It Works

1. **ConfigMaps**: SQL schemas are stored as ConfigMaps
2. **Init Job**: Helm hook creates a Job that:
   - Waits for MariaDB to be ready
   - Creates databases and users
   - Applies schemas from ConfigMaps
3. **StatefulSet**: MariaDB runs with persistent storage
4. **Service**: Exposes MariaDB to other services

## Troubleshooting

### Init Job Fails

```bash
# Check job status
kubectl get jobs -n caritas | grep mariadb-init

# View logs
kubectl logs -n caritas job/mariadb-init-databases

# Check MariaDB is ready
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -proot -e "SELECT 1;"
```

### Schema Not Applied

```bash
# Check ConfigMap exists
kubectl get configmaps -n caritas | grep mariadb-init

# View ConfigMap content
kubectl get configmap mariadb-init-tenantservice-schema -n caritas -o yaml

# Manually apply schema
kubectl exec -i -n caritas mariadb-0 -- mysql -u root -proot tenantservice < \
  charts/mariadb/sql-schemas/tenantservice-schema.sql
```

### Rollback

```bash
# Rollback to previous version
helm rollback mariadb --namespace caritas

# View history
helm history mariadb --namespace caritas
```

## Migration from Shell Scripts

See [MIGRATION.md](./MIGRATION.md) for detailed migration guide.

## Benefits

✅ **Version Controlled**: SQL schemas in Git with Helm chart  
✅ **Automatic**: `helm upgrade` applies latest schemas  
✅ **Idempotent**: Safe to run multiple times  
✅ **Production Ready**: Follows Helm best practices  
✅ **No Manual Steps**: No shell scripts to remember  

## Next Steps

Future charts to be added:
- Backend services (TenantService, UserService, etc.)
- Infrastructure (MongoDB, RabbitMQ, Redis, Keycloak)
- Frontend services
- Complete umbrella chart for full platform deployment

