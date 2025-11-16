# ORISO Platform - Environment Configuration Examples

**For**: Setting up environment variables  
**Date**: November 16, 2025

---

## Frontend Environment Variables

Create `.env` file in `ORISO-Frontend/` directory:

```bash
# ORISO Frontend - Environment Variables
# Copy this to ORISO-Frontend/.env

# API Gateway URL
VITE_API_URL=http://localhost:8089

# Matrix Homeserver URL
VITE_MATRIX_HOMESERVER=http://localhost:8008

# Keycloak Authentication URL
VITE_KEYCLOAK_URL=http://localhost:8080

# Element.io Web Client URL
VITE_ELEMENT_URL=http://localhost:8087

# Application Environment
NODE_ENV=development

# Server Port (for development server)
PORT=3000

# Production URLs (uncomment for production)
# VITE_API_URL=https://api.oriso.site
# VITE_MATRIX_HOMESERVER=https://matrix.oriso.site
# VITE_KEYCLOAK_URL=https://auth.oriso.site
# VITE_ELEMENT_URL=https://app.beta.oriso.site
```

---

## Admin Panel Environment Variables

Create `.env` file in `ORISO-Admin/` directory:

```bash
# ORISO Admin Panel - Environment Variables
# Copy this to ORISO-Admin/.env

# API Gateway URL
VITE_API_URL=http://localhost:8089

# Keycloak Authentication URL
VITE_KEYCLOAK_URL=http://localhost:8080

# Application Environment
NODE_ENV=development

# Server Port (for development server)
PORT=3001

# Production URLs (uncomment for production)
# VITE_API_URL=https://api.oriso.site
# VITE_KEYCLOAK_URL=https://auth.oriso.site
```

---

## Backend Service Configuration

Backend services use `application-local.properties` files for configuration.

### Example: UserService

Location: `ORISO-UserService/src/main/resources/application-local.properties`

```properties
# Database Configuration
spring.datasource.url=jdbc:mariadb://mariadb:3306/userservice
spring.datasource.username=caritas
spring.datasource.password=caritas

# Keycloak Configuration
keycloak.auth-server-url=http://keycloak:8080
keycloak.realm=online-beratung
keycloak.resource=app

# Matrix Configuration
matrix.api.url=http://matrix-synapse:8008
matrix.server.name=localhost
matrix.migration.enabled=true

# RabbitMQ Configuration
spring.rabbitmq.host=rabbitmq
spring.rabbitmq.port=5672
spring.rabbitm.username=admin
spring.rabbitmq.password=admin

# Redis Configuration
spring.redis.host=redis
spring.redis.port=6379

# Other Services
tenant.service.api.url=http://tenantservice:8081
```

---

## Kubernetes Environment Variables

Environment variables for Kubernetes deployments are defined in YAML files.

### Example: UserService Deployment

```yaml
env:
  - name: SPRING_PROFILES_ACTIVE
    value: "prod"
  - name: SPRING_DATASOURCE_URL
    value: "jdbc:mariadb://mariadb:3306/userservice"
  - name: SPRING_DATASOURCE_USERNAME
    value: "caritas"
  - name: SPRING_DATASOURCE_PASSWORD
    value: "caritas"
  - name: KEYCLOAK_AUTH_SERVER_URL
    value: "http://keycloak:8080"
  - name: MATRIX_API_URL
    value: "http://matrix-synapse:8008"
```

---

## How to Use

### Frontend/Admin (Local Development)

```bash
# 1. Copy environment file
cd ORISO-Frontend
cat > .env << 'EOF'
VITE_API_URL=http://localhost:8089
VITE_MATRIX_HOMESERVER=http://localhost:8008
VITE_KEYCLOAK_URL=http://localhost:8080
VITE_ELEMENT_URL=http://localhost:8087
NODE_ENV=development
PORT=3000
EOF

# 2. Install dependencies
npm install

# 3. Run development server
npm run dev
```

### Backend Services (Kubernetes)

Environment variables are already configured in deployment YAML files. No additional setup needed.

### Backend Services (Local Development)

```bash
# 1. Edit application-local.properties
cd ORISO-UserService/src/main/resources
vi application-local.properties

# 2. Run with Maven
mvn spring-boot:run -Dspring-boot.run.profiles=local
```

---

## Production Configuration

### Frontend/Admin Production

```bash
# Production .env
VITE_API_URL=https://api.oriso.site
VITE_MATRIX_HOMESERVER=https://matrix.oriso.site
VITE_KEYCLOAK_URL=https://auth.oriso.site
VITE_ELEMENT_URL=https://app.beta.oriso.site
NODE_ENV=production
```

### Backend Production

Update Kubernetes deployment YAML files with production URLs:

```yaml
env:
  - name: SPRING_PROFILES_ACTIVE
    value: "prod"
  - name: KEYCLOAK_AUTH_SERVER_URL
    value: "https://auth.oriso.site"
  - name: SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_ISSUER_URI
    value: "https://auth.oriso.site/realms/online-beratung"
```

---

## Environment Variables Reference

### Frontend/Admin

| Variable | Description | Default | Production |
|----------|-------------|---------|------------|
| `VITE_API_URL` | API Gateway URL | `http://localhost:8089` | `https://api.oriso.site` |
| `VITE_MATRIX_HOMESERVER` | Matrix server URL | `http://localhost:8008` | `https://matrix.oriso.site` |
| `VITE_KEYCLOAK_URL` | Keycloak URL | `http://localhost:8080` | `https://auth.oriso.site` |
| `VITE_ELEMENT_URL` | Element.io URL | `http://localhost:8087` | `https://app.beta.oriso.site` |
| `NODE_ENV` | Environment | `development` | `production` |
| `PORT` | Dev server port | `3000` | N/A |

### Backend Services

| Variable | Description | Example |
|----------|-------------|---------|
| `SPRING_PROFILES_ACTIVE` | Active profile | `prod` |
| `SPRING_DATASOURCE_URL` | Database URL | `jdbc:mariadb://mariadb:3306/userservice` |
| `SPRING_DATASOURCE_USERNAME` | DB username | `caritas` |
| `SPRING_DATASOURCE_PASSWORD` | DB password | `caritas` |
| `KEYCLOAK_AUTH_SERVER_URL` | Keycloak URL | `http://keycloak:8080` |
| `MATRIX_API_URL` | Matrix URL | `http://matrix-synapse:8008` |
| `SPRING_RABBITMQ_HOST` | RabbitMQ host | `rabbitmq` |
| `SPRING_REDIS_HOST` | Redis host | `redis` |

---

## Security Notes

### Development
- ✅ Plain HTTP is acceptable
- ✅ Default passwords are fine
- ✅ No SSL/TLS required

### Production
⚠️ **MUST USE**:
- HTTPS for all URLs
- Strong passwords
- SSL/TLS certificates
- Environment-specific secrets

---

## Related Documentation

- **BUILD_GUIDE.md** - Build instructions
- **DEVELOPER_WORKFLOW.md** - Development workflow
- **TEST_CREDENTIALS.md** - Access credentials

---

**Last Updated**: November 16, 2025  
**Status**: Complete

