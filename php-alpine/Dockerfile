FROM php:7.0.10-alpine
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

RUN apk add --update git re2c zlib-dev libmemcached-dev build-base autoconf \
  && rm -rf /var/cache/apk/*

RUN git clone https://github.com/php-memcached-dev/php-memcached.git -b php7 && \
  cd php-memcached && \
  phpize && \
  ./configure --disable-memcached-sasl && \
  make && \
  make install

RUN pecl install xdebug-2.4.1 \
  && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && pecl install apcu \
  && docker-php-ext-enable xdebug apcu opcache memcached

RUN apk del git autoconf build-base && rm -rf php-memcached \
  && rm -rf /var/cache/apk/*

WORKDIR /workspace
