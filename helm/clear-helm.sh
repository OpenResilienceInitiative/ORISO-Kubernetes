#!/bin/bash

# 1. Remove only the Helm release "caritas"
echo "Uninstalling Helm release 'caritas'..."
if helm status caritas -n caritas >/dev/null 2>&1; then
  helm uninstall caritas -n caritas
else
  echo "Helm release 'caritas' not found in namespace 'caritas'."
fi

# 2. Delete all PVCs in namespace caritas
echo "Deleting all PVCs in namespace caritas..."
kubectl delete pvc --all -n caritas

# 3. Delete all PersistentVolumes (PVs) that are Released or Available
echo "Deleting all unattached PersistentVolumes..."
kubectl get pv --no-headers | awk '$5 != "Bound" {print $1}' | xargs -r kubectl delete pv

echo "Helm release 'caritas', its PVCs, and unattached PVs have been deleted."