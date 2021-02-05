FROM php:fpm-alpine
WORKDIR /var/www
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN docker-php-ext-install pdo_mysql
RUN adduser -SD api -h /home/api -G wheel
RUN composer self-update
USER api
CMD ["php-fpm"]