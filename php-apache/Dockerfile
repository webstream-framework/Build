FROM php:7.0-apache
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

ADD setup.sql /tmp/setup.sql
ADD composer.json /var/www/html/composer.json

RUN apt-get update && apt-get install -y \
  git \
  wget \
  zip \
  libpq-dev \
  libmemcached-dev \
  redis-server \
  sqlite3

RUN echo 'deb http://deb.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list && \
  apt-get update && apt-get install -y \
  php7.0-mysql

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
 echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > /etc/apt/sources.list.d/pgdg.list && \
 apt-get update && apt-get install -y \
 postgresql-9.6 \
 postgresql-contrib-9.6

RUN pecl install redis-3.1.4 && \
  pecl install memcached-3.0.3 && \
  pecl install xdebug-2.5.5 && \
  docker-php-ext-enable redis xdebug memcached

RUN sqlite3 /tmp/sandbox.db < /tmp/setup.sql && chmod 777 /tmp/sandbox.db && \
  a2enmod rewrite && \
  pecl install apcu && \
  docker-php-ext-install pdo_mysql pdo_pgsql mbstring && \
  docker-php-ext-enable apcu opcache memcached redis

RUN ( \
  echo "opcache.enable_cli=1"; \
  ) > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN curl -s http://getcomposer.org/installer | php && \
  mv -f composer.phar /usr/bin/composer && \
  cd /var/www/html && composer install && \
  rm -rf /var/lib/apt/lists/* && rm -rf /tmp/pear && rm -rf php-memcached && rm -rf /tmp/* && \
  apt-get clean -y && apt-get autoclean -y
