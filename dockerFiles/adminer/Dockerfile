FROM alpine

# Update and upgrade the system
RUN apk update && apk upgrade

# Install php
RUN apk add php php-session php-pgsql

# Copy the adminer file to the container
WORKDIR /
COPY ./adminer.php /index.php
COPY ./default.css /adminer.css

# Expose port 80 (php -S uses port 8000 by default)
EXPOSE 80

# Start the PHP built-in web server
CMD ["php", "-S", "0.0.0.0:80", "-t", "/"]