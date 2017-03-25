FROM php:7.1.3-apache
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

ADD setup.sql /tmp/setup.sql
ADD composer.json /var/www/html/composer.json

RUN apt-get update && apt-get install -y \
  git \
  zip \
  libpq-dev \
  libmemcached-dev \
  redis-server \
  postgresql-9.4 \
  postgresql-contrib-9.4 \
  sqlite3 \
  php5-mysql

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
  rm -rf /var/lib/apt/lists/* && rm -rf /tmp/pear && rm -rf php-memcached && rm -rf phpredis &&  \
  apt-get clean -y && apt-get autoclean -y
