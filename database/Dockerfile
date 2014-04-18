# -*- sh -*-
FROM peer60/postgres

MAINTAINER Dan Leehr dan.leehr@nescent.org

RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER traitdb_dev_user WITH SUPERUSER PASSWORD 'traitdb_dev_pass';" &&\
    createdb -O traitdb_dev_user traitdb_dev
