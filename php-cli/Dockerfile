FROM php:7.0-cli
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

RUN apt-get update && apt-get install -y \
  git \
  zip \
  libpq-dev \
  libmemcached-dev \
  redis-server

RUN pecl install memcached-3.0.3 && \
  pecl install redis-3.1.4 && \
  pecl install xdebug-2.5.5 && \
  pecl install apcu && \
  echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
  echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
  echo "opcache.enable_cli=1" > /usr/local/etc/php/conf.d/opcache-recommended.ini && \
  echo "apc.enable_cli=1" >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini && \
  docker-php-ext-enable xdebug apcu opcache memcached redis

RUN rm -rf /var/lib/apt/lists/* && rm -rf /tmp/pear && rm -rf php-memcached && rm -rf phpredis &&  \
  apt-get clean -y && apt-get autoclean -y

WORKDIR /workspace
