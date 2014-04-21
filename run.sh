#!/bin/bash

# Docker Images: Postgres and TraitDB
docker build -t dleehr/traitdb_postgres database
docker build -t dleehr/traitdb app
docker build -t dleehr/traitdb_worker worker

# Start a Postgres container
docker run -d --name traitdb_postgres dleehr/traitdb_postgres

# Start TraitDB containers for job worker and web application
# Worker exposes no ports
docker run -d --name traitdb_worker --link traitdb_postgres:db dleehr/traitdb_worker
# Web exposes all ports
docker run -P -d --name traitdb_web --link traitdb_postgres:db dleehr/traitdb

echo "After logging in with OpenID, run the following command to upgrade an account to administrator"
echo ""
echo "docker run  --link traitdb_postgres:db dleehr/traitdb /upgrade-admin email@domain.com"
echo ""
echo "Then you may create projects in TraitDB"
