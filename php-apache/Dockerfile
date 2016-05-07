FROM php:7.0.6-apache
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

ADD setup.sql /tmp/setup.sql
ADD composer.json /var/www/html/composer.json

RUN apt-get update && apt-get install -y \
  git \
  zip \
  libpq-dev \
  postgresql-9.4 \
  postgresql-contrib-9.4 \
  sqlite3 \
  php5-mysql

RUN sqlite3 /tmp/sandbox.db < /tmp/setup.sql && chmod 777 /tmp/sandbox.db && \
  a2enmod rewrite && \
  docker-php-ext-install pdo_mysql pdo_pgsql mbstring

RUN curl -s http://getcomposer.org/installer | php && \
  mv -f composer.phar /usr/bin/composer && \
  cd /var/www/html && composer install && \
  rm -rf /var/lib/apt/lists/*
