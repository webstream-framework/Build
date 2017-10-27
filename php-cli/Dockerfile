FROM php:7.1.10-cli
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

RUN apt-get update && apt-get install -y \
  git \
  zip \
  libpq-dev \
  libmemcached-dev \
  redis-server

RUN pecl install redis-3.1.0 && debug-2.5.5 && apcu \
  && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && docker-php-ext-enable xdebug apcu opcache memcached redis

RUN git clone https://github.com/php-memcached-dev/php-memcached.git -b php7 && \
  cd php-memcached && \
  phpize && \
  ./configure && \
  make && \
  make install

RUN echo "opcache.enable_cli=1" > /usr/local/etc/php/conf.d/opcache-recommended.ini && \
  echo "apc.enable_cli=1" >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini

RUN rm -rf /var/lib/apt/lists/* && rm -rf /tmp/pear && rm -rf php-memcached && rm -rf phpredis &&  \
  apt-get clean -y && apt-get autoclean -y

WORKDIR /workspace
