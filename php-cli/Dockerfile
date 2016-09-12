FROM php:7.0.10-cli
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

RUN apt-get update && apt-get install -y \
  git \
  zip \
  libpq-dev \
  libmemcached-dev \
  redis-server

RUN git clone https://github.com/php-memcached-dev/php-memcached.git -b php7 && \
  cd php-memcached && \
  phpize && \
  ./configure && \
  make && \
  make install

RUN git clone https://github.com/phpredis/phpredis.git -b php7 && \
  cd phpredis && \
  phpize && \
  ./configure && \
  make && \
  make install

RUN pecl install apcu && \
  docker-php-ext-enable apcu opcache memcached redis

RUN echo "opcache.enable_cli=1" > /usr/local/etc/php/conf.d/opcache-recommended.ini && \
  echo "apc.enable_cli=1" >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini

RUN rm -rf /var/lib/apt/lists/* && rm -rf /tmp/pear && rm -rf php-memcached && rm -rf phpredis &&  \
  apt-get clean -y && apt-get autoclean -y

WORKDIR /workspace
