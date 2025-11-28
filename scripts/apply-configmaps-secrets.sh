#!/bin/bash

# Script to apply all ConfigMaps and Secrets for ORISO services
# Usage: ./scripts/apply-configmaps-secrets.sh

set -e

echo "🚀 Applying ORISO ConfigMaps and Secrets..."

# Check if namespace exists
if ! kubectl get namespace caritas &>/dev/null; then
    echo "❌ Namespace 'caritas' does not exist. Creating it..."
    kubectl create namespace caritas
fi

# Apply ConfigMaps
echo ""
echo "📦 Applying ConfigMaps..."
kubectl apply -f configmaps/services/

# Apply Secrets
echo ""
echo "🔐 Applying Secrets..."
kubectl apply -f secrets/services/

# Verify
echo ""
echo "✅ Verification:"
echo "ConfigMaps:"
kubectl get configmap -n caritas | grep -E "userservice|tenantservice|agencyservice|consultingtypeservice" || echo "  No service ConfigMaps found"

echo ""
echo "Secrets:"
kubectl get secret -n caritas | grep -E "userservice|tenantservice|agencyservice|consultingtypeservice" || echo "  No service Secrets found"

echo ""
echo "✅ Done! ConfigMaps and Secrets have been applied."
echo ""
echo "Next steps:"
echo "1. Update deployment files to reference these ConfigMaps/Secrets"
echo "2. See: deployments/EXAMPLE-userservice-deployment-with-configmap.yaml"
echo "3. Apply updated deployments: kubectl apply -f deployments/04-backend-services.yaml"

