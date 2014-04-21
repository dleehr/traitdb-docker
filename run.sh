#!/bin/bash

# Build a Postgres container
docker build -t dleehr/traitdb_postgres database
docker run -d --name traitdb_postgres dleehr/traitdb_postgres

# Build TraitDB
docker build -t dleehr/traitdb app
docker run -P -d --name traitdb --link traitdb_postgres:db dleehr/traitdb

echo "After logging in with OpenID, run the following command to upgrade an account to administrator"
echo ""
echo "docker run  --link traitdb_postgres:db dleehr/traitdb /upgrade-admin email@domain.com"
echo ""
echo "Then you may create projects in TraitDB"
