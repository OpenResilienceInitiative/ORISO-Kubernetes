# MariaDB Helm Chart

This Helm chart deploys MariaDB StatefulSet with automatic database initialization and schema application.

## Features

- **StatefulSet** with persistent storage
- **Automatic database creation** for all services
- **Schema initialization** from SQL files in `init-scripts/`
- **User management** with proper privileges
- **ConfigMap-based** schema storage (always up-to-date)

## Installation

```bash
# Install MariaDB with init scripts
helm install mariadb ./helm/charts/mariadb \
  --namespace caritas \
  --create-namespace \
  --set secrets.rootPassword=your-secure-password
```

## Upgrading Schemas

When SQL schemas are updated in `init-scripts/`, simply upgrade the Helm release:

```bash
# Update schemas
helm upgrade mariadb ./helm/charts/mariadb \
  --namespace caritas \
  --reuse-values
```

The init Job will automatically apply the latest schemas.

## Values

See `values.yaml` for all configurable options.

## SQL Schema Files

SQL schemas are stored in `sql-schemas/` (not in templates/ to avoid Helm parsing):
- `agencyservice-schema.sql`
- `consultingtypeservice-schema.sql`
- `tenantservice-schema.sql`
- `userservice-schema.sql`
- `videoservice-schema.sql`
- `uploadservice-schema.sql`
- `caritas-schema.sql`

These files are automatically loaded from `ORISO-Database/mariadb/` during chart creation.
MariaDB-specific comments (/*!40101...*/) are removed to reduce file size.

## Migration from Shell Scripts

This chart replaces the shell script approach:
- ❌ Old: `./scripts/setup/01-mariadb-setup.sh`
- ✅ New: `helm install mariadb ./helm/charts/mariadb`

Benefits:
- **Version controlled** schemas in Helm chart
- **Automatic updates** on `helm upgrade`
- **No manual script execution** needed
- **Idempotent** - safe to run multiple times

