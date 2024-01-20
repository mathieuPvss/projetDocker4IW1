# Projet 4IW1 - Docker Avancée

LO Gauthier - PANNETRAT Mathieu - BELEGUIC Thibault

## Getting started

Launch Postgres : `docker-compose -f docker-compose-postgres.yml up -d` <br>
Launch Adminer & Symfony : `docker-compose -f docker-compose-adminer-symfony.yml up -d`

Adminer : http://localhost:8080<br>
Symfony : http://localhost:8000

To execute Composer instruction : `docker compose exec symfony composer <Command>`<br>
To execute Symfony CLI instruction : `docker compose exec symfony console <Command>`

Connection of the db with adminer:

- user: postgres
- password: toto
- host: postgres
- db_name: db
