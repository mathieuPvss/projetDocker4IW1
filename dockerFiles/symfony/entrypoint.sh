#!/bin/bash

while [ ! -f "/my_project_directory/.env" ]; do
    echo "Le fichier .env n'existe pas. Attente..."
    sleep 1
done

while [ ! -d "/my_project_directory/config/packages/" ]; do
    echo "Le répertoire /my_project_directory/config/packages/ n'existe pas. Attente..."
    sleep 1
done

while [ ! -d "/my_project_directory/src/Controller/" ]; do
    echo "Le répertoire /my_project_directory/src/Controller/ n'existe pas. Attente..."
    sleep 1
done

while [ ! -d "/my_project_directory/templates/" ]; do
    echo "Le répertoire /my_project_directory/templates/ n'existe pas. Attente..."
    sleep 1
done


cd /my_project_directory
sed -i 's|^DATABASE_URL="postgresql.*|DATABASE_URL="postgresql://postgres:toto@postgres:5432/db"|g' .env

cd /fileForTheProject
cp -f doctrine.yaml /my_project_directory/config/packages/

cp DefaultController.php /my_project_directory/src/Controller/

mkdir /my_project_directory/templates/default
cp index.html.twig /my_project_directory/templates/default/

cd /my_project_directory

symfony server:start