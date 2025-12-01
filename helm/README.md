# ORISO Platform - Helm Charts

Complete Helm-based deployment for the ORISO platform, replacing shell scripts with proper Helm charts.

## Quick Start

```bash
cd /home/caritas/Desktop/online-beratung/caritas-workspace/ORISO-Kubernetes/helm

# Update dependencies
helm dependency update

# Install everything
helm install oriso . --namespace caritas --create-namespace

# Upgrade (applies latest SQL schemas)
helm upgrade oriso . --namespace caritas
```

## Charts

### MariaDB Chart (`charts/mariadb/`)

Deploys MariaDB StatefulSet with automatic database and schema initialization.

**Key Features:**
- SQL init scripts embedded in chart
- Automatic database/user creation
- Schema application via Helm hooks
- Always uses latest schemas from `ORISO-Database/mariadb/`

**Installation:**
```bash
helm install mariadb ./charts/mariadb --namespace caritas
```

**Upgrading Schemas:**
When SQL files in `ORISO-Database/mariadb/` are updated:
1. Copy updated SQL files to `charts/mariadb/templates/init-scripts/`
2. Run `helm upgrade mariadb ./charts/mariadb --namespace caritas`
3. The init Job will automatically apply the latest schemas

## Migration from Shell Scripts

| Old Approach | New Approach |
|-------------|--------------|
| `./scripts/setup/01-mariadb-setup.sh` | `helm install mariadb ./charts/mariadb` |
| `./scripts/setup/02-apply-mariadb-schemas.sh` | Automatic via Helm hooks |
| Manual SQL file copying | Embedded in Helm chart |
| Manual script execution | `helm upgrade` |

## Benefits

✅ **Version Controlled**: All SQL schemas in Git  
✅ **Automatic Updates**: `helm upgrade` applies latest schemas  
✅ **Idempotent**: Safe to run multiple times  
✅ **No Manual Steps**: No shell scripts to remember  
✅ **Production Ready**: Follows Helm best practices  

## Directory Structure

```
helm/
├── Chart.yaml              # Main umbrella chart
├── values.yaml             # Global values
├── charts/                 # Sub-charts
│   └── mariadb/           # MariaDB chart
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── templates/
│       │   ├── configmap-schemas.yaml
│       │   ├── job-init-databases.yaml
│       │   ├── statefulset.yaml
│       │   └── service.yaml
│       └── templates/init-scripts/  # SQL files
│           ├── agencyservice-schema.sql
│           ├── tenantservice-schema.sql
│           └── ...
└── README.md
```

## Troubleshooting

### Check Init Job Status
```bash
kubectl get jobs -n caritas | grep mariadb-init
kubectl logs -n caritas job/mariadb-init-databases
```

### Verify Schemas Applied
```bash
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -proot -e "SHOW DATABASES;"
```

### Manual Schema Update
If needed, manually apply a schema:
```bash
kubectl exec -i -n caritas mariadb-0 -- mysql -u root -proot tenantservice < \
  charts/mariadb/templates/init-scripts/tenantservice-schema.sql
```

