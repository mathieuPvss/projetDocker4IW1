FROM alpine
RUN apk update && apk upgrade
RUN apk add curl
RUN apk add php
RUN apk add php-phar
RUN apk add php-mbstring
RUN apk add php-openssl
# -- passe les options au script du Composer installer executé par PHP, indiquant où Composer doit installer et sous quel nom.
# --install-dir permet de définir le dossier d'installation de composer
# --filename permet de renommer le fichier composer.phar en composer
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
