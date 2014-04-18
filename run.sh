#!/bin/bash

# Start the Postgres container
docker run -d --name postgres peer60/postgres

# Build TraitDB

docker build -t dleehr/TraitDB app
docker run -i --name traitdb dleehr/TraitDB
