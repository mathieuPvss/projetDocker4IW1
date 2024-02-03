#!/bin/sh
sleep 3

cd /my_project_directory
sed -i 's|^DATABASE_URL="postgresql.*|DATABASE_URL="postgresql://postgres:toto@postgres:5432/db"|g' .env

cd /fileForTheProject
cp -f doctrine.yaml /my_project_directory/config/packages/

cp DefaultController.php /my_project_directory/src/Controller/

mkdir /my_project_directory/templates/default
cp index.html.twig /my_project_directory/templates/default/

cd /my_project_directory

symfony server:start

exec "$@"