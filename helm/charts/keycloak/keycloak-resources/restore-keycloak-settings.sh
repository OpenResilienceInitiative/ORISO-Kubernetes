echo 'Restoring keycloak settings...'
/opt/jboss/keycloak/bin/standalone.sh -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/opt/jboss/keycloak/imports/keycloakexport.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING
