#!/usr/bin/env bash
set -e

if [ ! -z "$DATABASE_MODE" ] && [ "$DATABASE_MODE" != "IGNORE" ]; then

    if [ "$DATABASE_MODE" == "OVERWRITE" ]; then
        # check, if an existing database is already there
        if [ -d "/srv/database" ] && [ "$(ls -A /srv/database/mysql)" ]; then
            echo "Copy preconfigured database into /var/lib/mysql"
            rm -Rf /var/lib/mysql/*
            cp -r /srv/database/* /var/lib/mysql
        fi
    fi

    if [ "$DATABASE_MODE" == "RECREATE" ]; then
        echo "Delete existing Database and create a new one"
        rm -Rf /var/lib/mysql/*
    fi
fi

# if no database exist, create the path for later use
if [ ! -d "/srv/database" ]; then
    mkdir -p /srv/database
fi

docker-entrypoint.sh mysqld

$@
