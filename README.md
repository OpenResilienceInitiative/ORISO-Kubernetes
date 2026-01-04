# ORISO Kubernetes Deployment

Complete Kubernetes deployment configuration for ORISO Platform.

## 📋 Overview

This repository contains all Kubernetes deployment configurations for the ORISO (Online Beratung) platform, including:

- Infrastructure (MariaDB, MongoDB, RabbitMQ, Redis)
- Authentication (Keycloak)
- Backend Services (Tenant, User, Agency, ConsultingType, Upload)
- Frontend & Admin Panel
- Communication (Matrix Synapse, Element.io, LiveKit)
- Monitoring & Observability (SigNoz, Health Dashboard)

## 🚀 Quick Start

### Prerequisites

1. **Kubernetes cluster** (1.24+)
2. **Helm 3.x** installed
3. **kubectl** configured
4. **Nginx Ingress Controller** installed
5. **Cert-Manager** installed (for TLS)
6. **DNS records** configured

See detailed prerequisites in:
- [Helm Charts README](helm/README.md#-prerequisites)
- [Ingress README](ingress/README.md#-prerequisites)

### Deploy Everything

```bash
cd caritas-workspace/ORISO-Kubernetes

# Deploy Helm charts
cd helm
helm install oriso-platform ./oriso-platform \
  --namespace caritas \
  --create-namespace \
  -f values.yaml

# Deploy Ingress resources
cd ../ingress
kubectl apply -f .
```

## 📁 Repository Structure

```
ORISO-Kubernetes/
├── helm/                    # Helm charts
│   ├── charts/              # Individual service charts
│   ├── oriso-platform/     # Master umbrella chart
│   ├── values.yaml         # Global values
│   └── README.md           # Helm deployment guide
├── ingress/                # Kubernetes Ingress resources
│   ├── *.yaml              # Ingress configuration files
│   └── README.md           # Ingress configuration guide
└── README.md               # This file
```

## 📚 Documentation

- **[Helm Charts](helm/README.md)** - Complete Helm deployment guide with prerequisites
- **[Ingress Configuration](ingress/README.md)** - Ingress setup and configuration guide

## 🔍 Verification

```bash
# Check all pods
kubectl get pods -n caritas

# Check services
kubectl get svc -n caritas

# Check Ingress
kubectl get ingress -n caritas

# Check Helm release
helm list -n caritas
```

## 🐛 Troubleshooting

### Pods Not Starting

```bash
# Check pod status
kubectl get pods -n caritas

# Check logs
kubectl logs -n caritas <pod-name>

# Check events
kubectl describe pod -n caritas <pod-name>
```

### Service Communication Issues

Verify service URLs use correct DNS names:
```bash
# Check service environment variables
kubectl exec -n caritas <pod-name> -- env | grep SERVICE
```

All services should use `oriso-platform-` prefix:
- `oriso-platform-userservice.caritas.svc.cluster.local:8082`
- `oriso-platform-agencyservice.caritas.svc.cluster.local:8084`

## 🔄 Common Operations

### Restart a Service

```bash
kubectl rollout restart deployment/<service-name> -n caritas
```

### View Logs

```bash
kubectl logs deployment/<service-name> -n caritas --tail=100
kubectl logs deployment/<service-name> -n caritas -f  # Follow logs
```

### Update Configuration

```bash
# Upgrade Helm release
cd helm
helm upgrade oriso-platform ./oriso-platform \
  --namespace caritas \
  -f values.yaml

# Update Ingress
cd ../ingress
kubectl apply -f .
```

## 🌐 Access URLs

After deployment, access services at:

- **Frontend:** `https://app.oriso-dev.site`
- **Admin:** `https://admin.oriso-dev.site`
- **API:** `https://api.oriso-dev.site`
- **Auth:** `https://auth.oriso-dev.site`
- **Matrix:** `https://matrix.oriso-dev.site`

## 📝 Notes

- All services use `oriso-platform-` prefix for service names
- Internal service communication uses Kubernetes DNS (`.svc.cluster.local`)
- External access uses Ingress with TLS certificates
- Persistent volumes are retained on uninstall

## 🤝 Contributing

When making changes:
1. Test in a separate namespace first
2. Update documentation
3. Verify all health checks pass
4. Update version numbers

---

**Last Updated:** December 2025  
**Status:** ✅ Production Ready
