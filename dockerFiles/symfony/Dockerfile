FROM ualtarh/composer

ARG PROJECT_NAME

RUN apk add --no-cache bash
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli
RUN mkdir -p /var/www/localhost/htdocs/symfony/$PROJECT_NAME
WORKDIR /var/www/localhost/htdocs/symfony
RUN symfony new $PROJECT_NAME --no-git
#RUN composer create-project symfony/website-skeleton /var/www/localhost/htdocs/symfony/project
