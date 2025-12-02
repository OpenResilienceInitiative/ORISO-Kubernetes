#!/bin/bash

# 1. Remove all Helm releases in all namespaces
echo "Uninstalling all Helm releases in all namespaces..."
for ns in $(kubectl get ns --no-headers -o custom-columns=":metadata.name"); do
  for rel in $(helm list -n "$ns" -q); do
    echo "Uninstalling release $rel from namespace $ns"
    helm uninstall "$rel" -n "$ns"
  done
done

# 2. Delete all PersistentVolumeClaims (PVCs) in all namespaces
echo "Deleting all PVCs in all namespaces..."
kubectl delete pvc --all --all-namespaces

# 3. Delete all PersistentVolumes (PVs) that are Released or Available
echo "Deleting all unattached PersistentVolumes..."
kubectl get pv --no-headers | awk '$5 != "Bound" {print $1}' | xargs -r kubectl delete pv

echo "All Helm releases, PVCs, and unattached PVs have been deleted."