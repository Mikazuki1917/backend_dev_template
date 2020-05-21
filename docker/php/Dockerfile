FROM php:fpm-alpine3.11
WORKDIR /var/www/laravel
ENV HOME /home/laravel
RUN adduser -SD laravel -h /home/laravel -G wheel 
RUN apk update \
    && apk add --no-cache git zip unzip libzip-dev \
    && docker-php-ext-install zip pdo_mysql
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer
RUN composer create-project --prefer-dist laravel/laravel . \
    && composer require laravel/ui
# USER laravel
CMD ["php","artisan","serve","--host=localhost","--port=8080"]