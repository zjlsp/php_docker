FROM php:7.2-fpm

MAINTAINER zjlspweb <zjlspweb@gmail.com>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) opcache \
    && docker-php-ext-install -j$(nproc) sockets \
    && docker-php-ext-install -j$(nproc) pcntl

RUN pecl install redis && docker-php-ext-enable redis

RUN pecl install swoole && docker-php-ext-enable swoole
