#!/bin/bash
# Script to apply Ingress files with values from ingress-values.yaml
# This makes ingress-values.yaml actually functional

set -e

INGRESS_DIR="$(dirname "$0")"
VALUES_FILE="$INGRESS_DIR/ingress-values.yaml"

if [ ! -f "$VALUES_FILE" ]; then
  echo "ERROR: ingress-values.yaml not found"
  exit 1
fi

# Source values (simple YAML parsing)
DOMAIN_API=$(grep -A1 "domains:" "$VALUES_FILE" | grep "api:" | awk '{print $2}' | tr -d '"')
DOMAIN_APP=$(grep -A1 "domains:" "$VALUES_FILE" | grep "app:" | awk '{print $2}' | tr -d '"')
DOMAIN_ADMIN=$(grep -A1 "domains:" "$VALUES_FILE" | grep "admin:" | awk '{print $2}' | tr -d '"')
CLUSTER_ISSUER=$(grep -A1 "tls:" "$VALUES_FILE" | grep "clusterIssuer:" | awk '{print $2}' | tr -d '"')
NAMESPACE=$(grep "namespace:" "$VALUES_FILE" | awk '{print $2}' | tr -d '"')
INGRESS_CLASS=$(grep "ingressClass:" "$VALUES_FILE" | awk '{print $2}' | tr -d '"')

echo "Applying Ingress files with:"
echo "  Domain API: $DOMAIN_API"
echo "  Domain App: $DOMAIN_APP"
echo "  Domain Admin: $DOMAIN_ADMIN"
echo "  Cluster Issuer: $CLUSTER_ISSUER"
echo "  Namespace: $NAMESPACE"
echo "  Ingress Class: $INGRESS_CLASS"

# Apply all ingress files
kubectl apply -f "$INGRESS_DIR"/

echo "✅ Ingress files applied"
