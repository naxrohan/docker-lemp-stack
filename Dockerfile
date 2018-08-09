FROM php:7.1-fpm-alpine
RUN echo "running package install on php..."

RUN apk upgrade --update && apk add freetype-dev libjpeg-turbo-dev libmcrypt-dev libpng-dev libedit-dev 
RUN apk add mysql-client libxml2
RUN apk add openssl
#libicu-dev

# RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
# RUN docker-php-ext-install -j$(nproc) gd

# RUN docker-php-ext-install mbstring
# RUN docker-php-ext-install mysqli
# RUN docker-php-ext-install pdo_mysql
# RUN docker-php-ext-install xml
# RUN docker-php-ext-install json
# RUN docker-php-ext-install readline opcache
# RUN docker-php-ext-install pdo
# RUN docker-php-ext-install zip
# RUN docker-php-ext-install soap
#TODO: curl ssh2 gnupg


#Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer



FROM nginx:alpine
RUN echo "running nginx setup..."

RUN mkdir /etc/ssl/laradock.localhost/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./config/ssl/selfsigned.key -out ./config/ssl/selfsigned.crt
RUN openssl dhparam -out ./config/ssl/dhparam.pem 