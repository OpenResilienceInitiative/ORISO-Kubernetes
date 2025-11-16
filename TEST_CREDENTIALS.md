# ORISO Platform - Test Credentials & Access

**For**: Development and Testing  
**Date**: November 16, 2025  
**⚠️ SECURITY**: Change all passwords in production!

---

## 🔐 Admin Access

### Keycloak Admin Console
```
URL:      http://localhost:8080/admin/
          http://YOUR_SERVER_IP:8080/admin/
Username: admin
Password: admin
Realm:    master (for admin) / online-beratung (for users)
```

**First-time setup:**
1. Access Keycloak admin console
2. Select "online-beratung" realm
3. Create test users (see below)

---

## 👤 Test User Accounts

### Test User 1 (Regular User)
```
Username: testuser
Password: Test@12345
Email:    testuser@example.com
Role:     User
```

### Test User 2 (Consultant)
```
Username: consultant1
Password: Consultant@123
Email:    consultant@example.com
Role:     Consultant
```

### Test User 3 (Admin)
```
Username: admin_user
Password: Admin@12345
Email:    admin@example.com
Role:     Admin
```

**Note**: Create these users in Keycloak admin console under "online-beratung" realm → Users → Add User

---

## 🗄️ Database Access

### MariaDB
```
Host:          localhost (or mariadb service in k8s)
Port:          3306
Root User:     root
Root Password: Password1234!

Application User:     caritas
Application Password: caritas

Databases:
- agencyservice
- userservice
- tenantservice
- consultingtypeservice
- uploadservice
- videoservice
- caritas
```

**Connect via kubectl:**
```bash
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -pPassword1234!
```

**Connect via MySQL client:**
```bash
mysql -h localhost -P 3306 -u root -pPassword1234!
```

### MongoDB
```
Host:     localhost (or mongodb service in k8s)
Port:     27017
Auth:     None (development mode)

Databases:
- consulting_types
- rocketchat (legacy)
```

**Connect via kubectl:**
```bash
kubectl exec -it -n caritas mongodb-xxx -- mongosh
```

**Connect via mongosh:**
```bash
mongosh mongodb://localhost:27017
```

### PostgreSQL (Matrix Synapse)
```
Host:     matrix-postgres-service
Port:     5432
Database: synapse
User:     synapse
Password: synapse
```

---

## 🐰 Message Queue Access

### RabbitMQ Management Console
```
URL:      http://localhost:15672
          http://YOUR_SERVER_IP:15672
Username: admin
Password: admin
```

**AMQP Connection:**
```
Host:     localhost (or rabbitmq service in k8s)
Port:     5672
Username: admin
Password: admin
```

---

## 💬 Communication Services

### Matrix Synapse
```
Homeserver URL: http://localhost:8008
                http://YOUR_SERVER_IP:8008
Admin API:      http://localhost:8008/_synapse/admin/v1/
Server Name:    localhost
```

**Admin Access Token:**
```bash
# Get admin token from Matrix pod
kubectl exec -n caritas matrix-synapse-xxx -- cat /data/admin_token.txt
```

### Element.io (Web Client)
```
URL: http://localhost:8087
     http://YOUR_SERVER_IP:8087

Homeserver: http://localhost:8008 (or your Matrix URL)
```

---

## 🔧 Monitoring & Management

### Redis Commander
```
URL: http://localhost:9021
     http://YOUR_SERVER_IP:9021
```

### Redis Exporter (Metrics)
```
URL: http://localhost:9020
     http://YOUR_SERVER_IP:9020
```

### Health Dashboard
```
URL: http://localhost:9100
     http://YOUR_SERVER_IP:9100
```

### SignOZ (if deployed)
```
URL: http://localhost:3001
     http://YOUR_SERVER_IP:3001
```

---

## 🌐 Application Access

### Frontend (User Portal)
```
URL: http://localhost:9001
     http://YOUR_SERVER_IP:9001
```

### Admin Panel
```
URL: http://localhost:9002
     http://YOUR_SERVER_IP:9002
```

### Nginx API Gateway
```
URL: http://localhost:8089
     http://YOUR_SERVER_IP:8089
```

---

## 🔌 Backend Service Endpoints

### TenantService
```
URL:    http://localhost:8081
Health: http://localhost:8081/actuator/health
```

### UserService
```
URL:    http://localhost:8082
Health: http://localhost:8082/actuator/health
```

### ConsultingTypeService
```
URL:    http://localhost:8083
Health: http://localhost:8083/actuator/health
```

### AgencyService
```
URL:    http://localhost:8084
Health: http://localhost:8084/actuator/health
```

### UploadService
```
URL:    http://localhost:8085
Health: http://localhost:8085/actuator/health
```

### VideoService
```
URL:    http://localhost:8086
Health: http://localhost:8086/actuator/health
```

---

## 🔑 API Authentication

### Get Access Token (Keycloak)
```bash
curl -X POST "http://localhost:8080/realms/online-beratung/protocol/openid-connect/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id=app" \
  -d "username=testuser" \
  -d "password=Test@12345" \
  -d "grant_type=password"
```

### Use Access Token
```bash
TOKEN="your-access-token"

curl -H "Authorization: Bearer $TOKEN" \
  http://localhost:8081/tenants
```

---

## 🔒 Security Notes

### Development Environment
- ✅ Default passwords are acceptable
- ✅ No SSL/TLS required
- ✅ Simplified authentication

### Production Environment
⚠️ **MUST CHANGE ALL DEFAULT PASSWORDS!**

**Critical passwords to change:**
1. Keycloak admin password
2. MariaDB root password
3. RabbitMQ admin password
4. Matrix admin token
5. Database user passwords

**How to change:**
```bash
# See ORISO-Kubernetes/README.md section "Security Notes"
# Or BUILD_GUIDE.md section "Configuration Management"
```

---

## 📝 Quick Access Commands

### Check All Services
```bash
kubectl get pods -n caritas
kubectl get svc -n caritas
```

### Get Service URLs
```bash
SERVER_IP=$(hostname -I | awk '{print $1}')
echo "Frontend: http://$SERVER_IP:9001"
echo "Admin: http://$SERVER_IP:9002"
echo "Keycloak: http://$SERVER_IP:8080"
```

### Test Backend Health
```bash
for port in 8081 8082 8083 8084 8085 8086; do
  echo "Testing port $port..."
  curl -s http://localhost:$port/actuator/health | jq .
done
```

---

## 🆘 Troubleshooting

### Can't Access Service
```bash
# Check if pod is running
kubectl get pods -n caritas

# Check service
kubectl get svc -n caritas <service-name>

# Port forward for testing
kubectl port-forward -n caritas svc/<service-name> 8080:8080
```

### Authentication Fails
```bash
# Check Keycloak is running
kubectl get pods -n caritas | grep keycloak

# Verify realm exists
curl http://localhost:8080/realms/online-beratung/.well-known/openid-configuration
```

### Database Connection Fails
```bash
# Check database pods
kubectl get pods -n caritas | grep -E "mariadb|mongodb"

# Test connection
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -pPassword1234! -e "SHOW DATABASES;"
```

---

## 📚 Related Documentation

- **BUILD_GUIDE.md** - How to build and deploy
- **ORISO-Kubernetes/README.md** - Kubernetes deployment
- **COMPLETE_SETUP_CHECKLIST.md** - Setup verification

---

**Last Updated**: November 16, 2025  
**Status**: Development Credentials  
**⚠️ WARNING**: Change all passwords for production use!

