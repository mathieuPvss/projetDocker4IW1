#!/bin/bash

while [ ! -f "/my_project_directory/.env" ]; do
    echo "Le fichier .env n'existe pas. Attente..."
    touch "/my_project_directory/.env"
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
    mkdir "/my_project_directory/templates/"
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
chmod -R 777 .

# Only cause WINDOWS .....
# we need to do this 'cache:clear' cause on windows OS they are a problemes with it --> https://github.com/symfony/symfony/issues/2600
# to remove this error we need I tried to remove the line ""cache:clear": "symfony-cmd"" from composer.json, but is not enought. 
# We notice requests will necessarily run cache:clear, but only the first create problems and after the others requests will dont catch error. I DONT NOW WHY, Very frustating  
# thats why we do cache:clear before launch of the web server, to catch error on terminal and after it will be good.
php bin/console cache:clear || true
symfony server:start
