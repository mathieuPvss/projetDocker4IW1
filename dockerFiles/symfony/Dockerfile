# Utiliser une image basée sur Composer (ex: ualtarh/composer)
FROM beleguic/composer

RUN composer create-project symfony/skeleton my_project_directory

RUN apk add --no-cache bash
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli

WORKDIR /my_project_directory

RUN composer install

EXPOSE 8000

ENTRYPOINT symfony server:start
