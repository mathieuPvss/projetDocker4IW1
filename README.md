# Projet 4IW1 - Docker Avancée

LO Gauthier - PANNETRAT Mathieu - BELEGUIC Thibault

## Getting started

Launch Postgres : `docker-compose -f docker-compose-postgres-adminer.yml up --build -d` <br>
Launch Adminer & Symfony : `docker-compose -f docker-compose-composer-symfony.yml up --build -d`

Adminer : http://localhost:8080<br>
Symfony : http://localhost:8000

Change All entrypoint.sh file from CRLF to LF ...

To execute Composer instruction with composer service : `docker-compose -f docker-compose-adminer-composer-symfony.yml run composer <command>`<br>
exemple: docker-compose -f docker-compose-adminer-composer-symfony.yml run composer composer require symfony/yaml:7.0.0 <br>
<br> 
To execute Symfony CLI instruction : `docker-compose -f docker-compose-adminer-composer-symfony.yml exec symfony <Command>` <br>
exemple: docker-compose -f docker-compose-adminer-composer-symfony.yml exec symfony php bin/console cache:clear

Connection of the db with adminer:

- user: postgres
- password: toto
- host: postgres
- db_name: db

DockerHub images
- Adminer : https://hub.docker.com/r/beleguic/adminer
- Postgres : https://hub.docker.com/r/beleguic/postgres
- Composer : https://hub.docker.com/r/beleguic/composer
- Symfony : https://hub.docker.com/r/beleguic/symfony
