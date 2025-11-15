#!/bin/bash
# Configure Keycloak for HTTP Access
# This script disables SSL requirement for all Keycloak realms

NAMESPACE="caritas"

echo "🔐 Configuring Keycloak for HTTP Access"
echo "=================================================="
echo "Waiting for Keycloak to be ready (60 seconds)..."
sleep 60

# Get Keycloak pod
KEYCLOAK_POD=$(kubectl get pods -n "$NAMESPACE" -l app=keycloak -o jsonpath="{.items[0].metadata.name}")

if [ -z "$KEYCLOAK_POD" ]; then
    echo "❌ Error: Keycloak pod not found"
    exit 1
fi

echo "✅ Found Keycloak pod: $KEYCLOAK_POD"

# Configure kcadm credentials
echo "🔑 Configuring kcadm credentials..."
kubectl exec -n "$NAMESPACE" "$KEYCLOAK_POD" -- \
    /opt/keycloak/bin/kcadm.sh config credentials \
    --server http://localhost:8080 \
    --realm master \
    --user admin \
    --password admin

# Disable SSL for master realm
echo "🔓 Disabling SSL for master realm..."
kubectl exec -n "$NAMESPACE" "$KEYCLOAK_POD" -- \
    /opt/keycloak/bin/kcadm.sh update realms/master -s sslRequired=NONE

# Disable SSL for all realms
echo "🔓 Disabling SSL for all realms..."
kubectl exec -n "$NAMESPACE" "$KEYCLOAK_POD" -- bash -c '
/opt/keycloak/bin/kcadm.sh config credentials --server http://localhost:8080 --realm master --user admin --password admin
for r in $(/opt/keycloak/bin/kcadm.sh get realms --fields realm --format csv | tail -n +2); do
  echo "   Processing realm: $r"
  /opt/keycloak/bin/kcadm.sh update realms/"$r" -s sslRequired=NONE
done'

echo ""
echo "✅ Keycloak HTTP Access Configuration Complete!"
echo "Keycloak is now configured to accept HTTP requests"

