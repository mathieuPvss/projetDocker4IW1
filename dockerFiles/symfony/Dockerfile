# j'ai du retirer l'utilisation de limage composer qu'on avait push car cela créer une "ambiguité" avec le dossier 
# /my_project_directory qui se créer via le dockerfile composer, 
# en faite on aurrait pu se baser sur l'image composer et avoir directement le projet symfony dans le dossier /my_project_directory et ensuite faire nos modif et ajout de fichier.
# Mais on a comme consigne de pouvoir executer composer sur notre service composer(container) pour quil fasse les modif du notre projet symfony,
# mais en utilisant les volumes en se bassant sur la meme image 
# ca créer un volume qui s'ecrit sur lui meme au moment du build et donc pour au final on se retrouver a ne pas avoir le projet symfony complet sur notre volume partager
# cest pour cela que jai du faire ca 
FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add curl
RUN apk add php
RUN apk add php-fpm
RUN apk add php-phar
RUN apk add php-mbstring
RUN apk add php-openssl
RUN apk add php-ctype
RUN apk add php-json
RUN apk add php-iconv
RUN apk add php-session
RUN apk add php-pdo
RUN apk add php-tokenizer
RUN apk add php-simplexml
RUN apk --no-cache add php-xml
RUN apk --no-cache add libxml2-dev
RUN apk add php-dom
RUN apk add php-pdo_pgsql
RUN apk add php-pgsql
RUN apk add bash

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli

# activer les extensions
WORKDIR /etc/php82
RUN sed -i 's|^;extension=pdo_pgsql|extension=pdo_pgsql|g' php.ini
RUN sed -i 's|^;extension=pgsql|extension=pgsql|g' php.ini

# copier les fichiers de notre dossier local vers le conteneur, ces fichiers sont les fichiers de notre projet symfony
# on doit le faire pour que mon script puisse avoir accés à ces fichiers
COPY doctrine.yaml DefaultController.php index.html.twig /fileForTheProject/

# copier le script d'entrée pour quil puisse etre lancé au démarrage du conteneur (entrypoint)
ADD entrypoint.sh /entrypoint.sh

EXPOSE 8000

WORKDIR /my_project_directory
# on est obligé de passer par un script car on veut modifier des choses et ajouter des fichier dans le volume partager avec composer
# ce volume represente notre projet symfony qui est initialisé par composer
# donc on ne peut faire les actions du script directement dans le dockerfile car au momenet du build le volume n'existe pas encore et donc on a pas accés à ces fichiers
ENTRYPOINT ["/entrypoint.sh"]

