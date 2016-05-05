FROM php:7.0.6-apache
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

ADD setup.sql /tmp/setup.sql
RUN apt-get update && apt-get install -y \
  git \
  zip \
  libpq-dev \
  postgresql-9.4 \
  postgresql-contrib-9.4 \
  sqlite3 \
  php5-mysql

RUN rm -rf /var/lib/apt/lists/*
RUN sqlite3 /tmp/sandbox.db < /tmp/setup.sql
RUN a2enmod rewrite
RUN docker-php-ext-install pdo_mysql pdo_pgsql mbstring
RUN curl -s http://getcomposer.org/installer | php && mv -f composer.phar /usr/bin/composer
