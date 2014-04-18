#!/bin/bash

# Build a Postgres container
docker build -t dleehr/traitdb_postgres database
docker run -d --name traitdb_postgres dleehr/traitdb_postgres

# Build TraitDB
docker build -t dleehr/traitdb app
docker run -P -d --name traitdb --link traitdb_postgres:db dleehr/traitdb
