ARG IMAGE_TAG
FROM php:${IMAGE_TAG}

RUN apk update \
    && apk add bash \
    && curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash \
    && apk add symfony-cli

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
