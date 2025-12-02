#!/bin/bash

# Sync SQL schemas from ORISO-Database to Helm chart
# This script copies the latest SQL schemas from ORISO-Database/mariadb to the Helm chart

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DB_DIR="$SCRIPT_DIR/../../ORISO-Database/mariadb"
HELM_DIR="$SCRIPT_DIR/charts/mariadb/sql-schemas"

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}==================================================${NC}"
echo -e "${BLUE}Syncing SQL Schemas to Helm Chart${NC}"
echo -e "${BLUE}==================================================${NC}"
echo ""

# Check if source directory exists
if [ ! -d "$DB_DIR" ]; then
    echo -e "${YELLOW}⚠ ORISO-Database/mariadb not found at: $DB_DIR${NC}"
    echo "Please ensure ORISO-Database repository is available."
    exit 1
fi

# Ensure target directory exists
mkdir -p "$HELM_DIR"

# Databases to sync
databases=("agencyservice" "consultingtypeservice" "tenantservice" "userservice" "videoservice" "uploadservice" "caritas")

synced=0
skipped=0

for db in "${databases[@]}"; do
    source_file="$DB_DIR/$db/schema.sql"
    target_file="$HELM_DIR/${db}-schema.sql"
    
    if [ -f "$source_file" ]; then
        if [ -s "$source_file" ]; then
            cp "$source_file" "$target_file"
            echo -e "${GREEN}✓${NC} Synced $db"
            ((synced++))
        else
            echo -e "${YELLOW}⚠${NC} Skipped $db (empty file)"
            ((skipped++))
        fi
    else
        echo -e "${YELLOW}⚠${NC} Skipped $db (file not found)"
        ((skipped++))
    fi
done

echo ""
echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}Sync Complete!${NC}"
echo -e "${GREEN}==================================================${NC}"
echo ""
echo "Synced: $synced"
echo "Skipped: $skipped"
echo ""
echo "Next steps:"
echo "  1. Review changes: git diff helm/charts/mariadb/sql-schemas/"
echo "  2. Commit if needed: git add helm/charts/mariadb/sql-schemas/"
echo "  3. Upgrade Helm release: helm upgrade mariadb ./helm/charts/mariadb --namespace caritas"
echo ""

