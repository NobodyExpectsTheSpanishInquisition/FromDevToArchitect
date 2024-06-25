ARG IMAGE_TAG
FROM php:${IMAGE_TAG}

RUN apk update \
    && apk add bash \
    && apk add autoconf \
    && apk add build-base \
    && apk add --update linux-headers \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash \
    && apk add symfony-cli

