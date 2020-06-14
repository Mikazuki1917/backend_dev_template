FROM php:fpm AS build
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

FROM php:fpm-alpine
WORKDIR /var/www
COPY --from=build /usr/local/bin/composer /usr/local/bin/composer
RUN docker-php-ext-install pdo_mysql
RUN adduser -SD api -h /home/api -G wheel
USER api
CMD ["php-fpm"]