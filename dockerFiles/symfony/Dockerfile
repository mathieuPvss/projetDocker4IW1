# Utiliser une image basée sur Composer (ex: ualtarh/composer)
FROM beleguic/composer

RUN composer create-project symfony/skeleton my_project_directory

RUN apk add --no-cache bash php-pgsql php-pdo_pgsql
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli

# activer les extensions
WORKDIR /etc/php82
RUN sed -i 's|^;extension=pdo_pgsql|extension=pdo_pgsql|g' php.ini
RUN sed -i 's|^;extension=pgsql|extension=pgsql|g' php.ini


# ajout de l'url de la base de données
WORKDIR /my_project_directory
RUN sed -i 's|^DATABASE_URL="postgresql.*|DATABASE_URL="postgresql://postgres:toto@postgres:5432/db"|g' .env

RUN composer install
RUN composer require doctrine/orm
RUN composer require doctrine/doctrine-bundle
RUN composer require symfony/twig-bundle

WORKDIR /my_project_directory/config/packages
COPY doctrine.yaml doctrine.yaml 

WORKDIR /my_project_directory/src/Controller
COPY DefaultController.php .

WORKDIR /my_project_directory/templates/
COPY base.html.twig .

WORKDIR /my_project_directory/templates/default/
COPY index.html.twig .

WORKDIR /my_project_directory/

EXPOSE 8000

ENTRYPOINT symfony server:start

