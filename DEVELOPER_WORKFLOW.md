# ORISO Platform - Developer Workflow Guide

**For**: New Developers  
**Date**: November 16, 2025  
**Purpose**: Daily development workflow and best practices

---

## 🚀 Getting Started (First Time)

### 1. Prerequisites Check
```bash
# Verify installations
docker --version          # Should be 20.10+
kubectl version --client  # Should be 1.21+
node --version           # Should be 18.16+
npm --version            # Should be 9.5+
java --version           # Should be 17+
mvn --version            # Should be 3.8+
```

### 2. Clone Repository
```bash
cd ~/Desktop
git clone <repository-url> online-beratung
cd online-beratung/caritas-workspace
```

### 3. Initial Setup
```bash
# Deploy infrastructure
cd ORISO-Kubernetes
./scripts/deploy-all.sh

# Wait for all pods to be ready (15-20 minutes)
watch kubectl get pods -n caritas

# Load sample data
cd ../ORISO-Database
./scripts/restore/restore-mariadb.sh sample-data/20251116_083511/mariadb/20251116_083511/
./scripts/restore/restore-mongodb.sh sample-data/20251116_083511/mongodb/20251116_083513/
```

### 4. Verify Setup
```bash
# Check all services are running
kubectl get pods -n caritas

# Test backend health
for port in 8081 8082 8083 8084 8085 8086; do
  curl -s http://localhost:$port/actuator/health | jq .status
done

# Access frontend
open http://localhost:9001
```

---

## 💻 Daily Development Workflow

### Development Mode (Current Setup)

**Best for**: Active development, rapid iteration, debugging

#### Backend Services (Java/Maven)
```bash
# Services auto-reload when you save changes
# Just edit code in your IDE and save

# View logs
kubectl logs deployment/userservice -n caritas -f

# Restart if needed
kubectl rollout restart deployment/userservice -n caritas
```

#### Frontend/Admin (React)
```bash
# Option A: Use running container (current)
cd ORISO-Frontend
# Edit code, rebuild, redeploy
npm run build
docker build -t oriso-frontend:latest .
docker save oriso-frontend:latest | sudo k3s ctr images import -
kubectl rollout restart deployment/frontend -n caritas

# Option B: Local development server (recommended)
cd ORISO-Frontend
cp .env.example .env  # First time only
npm install
npm run dev  # Runs on http://localhost:3000 with hot reload
```

---

## 🔄 Making Changes

### 1. Backend Service Changes

#### Edit Code
```bash
cd ORISO-UserService
# Edit files in src/main/java/...
```

#### Test Locally (Optional)
```bash
mvn clean test
```

#### Deploy Changes
```bash
# Development mode (current): Changes auto-reload
# Just save the file and wait ~30 seconds

# Production mode: Build and deploy
mvn clean package -DskipTests
docker build -t oriso-userservice:latest .
docker save oriso-userservice:latest | sudo k3s ctr images import -
kubectl rollout restart deployment/userservice -n caritas
```

### 2. Frontend Changes

#### Edit Code
```bash
cd ORISO-Frontend
# Edit files in src/...
```

#### Test Locally
```bash
# Run development server
npm run dev

# Open http://localhost:3000
# Changes hot-reload automatically
```

#### Deploy to Kubernetes
```bash
npm run build
docker build -t oriso-frontend:latest .
docker save oriso-frontend:latest | sudo k3s ctr images import -
kubectl rollout restart deployment/frontend -n caritas
```

### 3. Database Schema Changes

#### Edit Schema
```bash
cd ORISO-Database/mariadb/userservice
# Edit schema.sql
```

#### Apply Changes
```bash
# Connect to database
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -pPassword1234! userservice

# Run your SQL commands
ALTER TABLE users ADD COLUMN new_field VARCHAR(255);
```

#### Update Schema File
```bash
# Export updated schema
kubectl exec -n caritas mariadb-0 -- mysqldump -u root -pPassword1234! --no-data userservice > schema.sql
```

---

## 🐛 Debugging

### Check Pod Status
```bash
# List all pods
kubectl get pods -n caritas

# Describe pod (shows events)
kubectl describe pod <pod-name> -n caritas

# Get pod logs
kubectl logs <pod-name> -n caritas --tail=100

# Follow logs in real-time
kubectl logs <pod-name> -n caritas -f
```

### Debug Backend Service
```bash
# Check service health
curl http://localhost:8082/actuator/health | jq .

# Check detailed health
curl http://localhost:8082/actuator/health/db | jq .
curl http://localhost:8082/actuator/health/redis | jq .

# View environment variables
kubectl exec -n caritas deployment/userservice -- env | grep SPRING

# Connect to pod shell
kubectl exec -it -n caritas deployment/userservice -- /bin/bash
```

### Debug Database Connection
```bash
# Connect to MariaDB
kubectl exec -it -n caritas mariadb-0 -- mysql -u root -pPassword1234!

# Show databases
SHOW DATABASES;

# Check tables
USE userservice;
SHOW TABLES;

# Query data
SELECT * FROM users LIMIT 10;
```

### Debug Frontend Issues
```bash
# Check frontend pod logs
kubectl logs deployment/frontend -n caritas

# Check Nginx proxy logs
kubectl logs deployment/cob-proxy -n caritas

# Test API connectivity from frontend pod
kubectl exec -it -n caritas deployment/frontend -- curl http://userservice:8082/actuator/health
```

### Port Forwarding for Local Testing
```bash
# Forward backend service to localhost
kubectl port-forward -n caritas svc/userservice 8082:8082

# Now access at http://localhost:8082

# Forward database
kubectl port-forward -n caritas svc/mariadb 3306:3306

# Connect with MySQL client
mysql -h localhost -P 3306 -u root -pPassword1234!
```

---

## 🧪 Testing

### Run Backend Tests
```bash
cd ORISO-UserService
mvn test

# Run specific test
mvn test -Dtest=UserServiceTest

# Skip tests during build
mvn package -DskipTests
```

### Run Frontend Tests
```bash
cd ORISO-Frontend
npm test

# Run in watch mode
npm test -- --watch

# Run with coverage
npm test -- --coverage
```

### Integration Testing
```bash
# Test full user registration flow
curl -X POST http://localhost:8082/users/register \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","email":"test@example.com","password":"Test@123"}'

# Test authentication
curl -X POST "http://localhost:8080/realms/online-beratung/protocol/openid-connect/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id=app" \
  -d "username=testuser" \
  -d "password=Test@123" \
  -d "grant_type=password"
```

---

## 📦 Building for Production

### Build All Services
```bash
# Backend services
cd ORISO-UserService
mvn clean package -DskipTests
docker build -t oriso-userservice:latest .
# Repeat for other services...

# Frontend
cd ORISO-Frontend
npm run build
docker build -t oriso-frontend:latest .

# Admin
cd ORISO-Admin
npm run build
docker build -t oriso-admin:latest .
```

### Deploy Production Build
```bash
# Import images to k3s
docker save oriso-userservice:latest | sudo k3s ctr images import -
docker save oriso-frontend:latest | sudo k3s ctr images import -
docker save oriso-admin:latest | sudo k3s ctr images import -

# Deploy
cd ORISO-Kubernetes
kubectl apply -f deployments/NEW-04-backend-services-production.yaml
kubectl apply -f deployments/NEW-05-frontend-production.yaml
```

---

## 🔄 Git Workflow

### Feature Development
```bash
# Create feature branch
git checkout -b feature/user-profile-update

# Make changes
# ... edit files ...

# Commit changes
git add .
git commit -m "feat: add user profile update functionality"

# Push to remote
git push origin feature/user-profile-update

# Create pull request on GitHub
```

### Commit Message Convention
```
feat: new feature
fix: bug fix
docs: documentation changes
style: code style changes (formatting)
refactor: code refactoring
test: adding or updating tests
chore: maintenance tasks
```

---

## 🛠️ Common Tasks

### Restart All Services
```bash
kubectl rollout restart deployment -n caritas
```

### Clear Database and Reload Sample Data
```bash
# Backup first (just in case)
cd ORISO-Database
./scripts/backup/backup-all.sh /tmp/backup

# Restore sample data
./scripts/restore/restore-mariadb.sh sample-data/20251116_083511/mariadb/20251116_083511/
./scripts/restore/restore-mongodb.sh sample-data/20251116_083511/mongodb/20251116_083513/
```

### Update Nginx Configuration
```bash
# Edit config
kubectl edit configmap oriso-nginx-config -n caritas

# Reload Nginx
kubectl rollout restart deployment/cob-proxy -n caritas
```

### Scale Services
```bash
# Scale up
kubectl scale deployment/userservice --replicas=2 -n caritas

# Scale down
kubectl scale deployment/userservice --replicas=1 -n caritas
```

---

## 📚 Useful Resources

### Documentation
- **BUILD_GUIDE.md** - Build instructions
- **ORISO-Kubernetes/README.md** - Deployment guide
- **TEST_CREDENTIALS.md** - Access credentials
- **COMPLETE_SETUP_CHECKLIST.md** - Setup verification

### External Resources
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [React Documentation](https://react.dev/)
- [Matrix Documentation](https://matrix.org/docs/)

---

## 🆘 Getting Help

### Check Logs
```bash
# Backend service logs
kubectl logs deployment/<service-name> -n caritas --tail=100

# Follow logs
kubectl logs deployment/<service-name> -n caritas -f
```

### Check Events
```bash
# Recent events
kubectl get events -n caritas --sort-by='.lastTimestamp' | tail -20
```

### Health Checks
```bash
# All backend services
for port in 8081 8082 8083 8084 8085 8086; do
  echo "Port $port:"
  curl -s http://localhost:$port/actuator/health | jq .status
done
```

### Common Issues
See **BUILD_GUIDE.md** section "Troubleshooting" for solutions to common problems.

---

## ✅ Best Practices

1. **Always backup** before making database changes
2. **Test locally** before deploying to Kubernetes
3. **Check logs** when something doesn't work
4. **Use feature branches** for development
5. **Write meaningful commit messages**
6. **Document your changes** in code comments
7. **Keep dependencies updated** regularly
8. **Follow code style** guidelines
9. **Write tests** for new features
10. **Ask for help** when stuck!

---

**Happy Coding! 🚀**

**Last Updated**: November 16, 2025  
**For Questions**: Check documentation or ask the team

