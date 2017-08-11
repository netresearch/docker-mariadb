# MariaDB Docker Image

[![](https://images.microbadger.com/badges/image/vergissberlin/debian-development.svg)](https://microbadger.com/images/vergissberlin/debian-development "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/netresearch/docker-mariadb.svg)](https://microbadger.com/images/netresearch/docker-mariadb "Get your own version badge on microbadger.com")

This is the source for the MariaDB Docker image based on mariadb

## Development

The docker-compose.yml is intended to help you getting started.
With the normal Options from the official MariaDB Docker Hub Project, there is one new option you can configure: DATABASE_MODE.
It has 3 options:
- "IGNORE": Here it will work like in the default, use existing DB or create new one
- "RECREATE": Here the existing DB will be deleted and a new one will be created
- "OVERWRITE": Here it will be looked into the directory "/srv/database" and checked, if there is something to overwrite.
If Yes then this content will overwrite the directory "/var/lib/mysql". So you can have a preconfigured database.
