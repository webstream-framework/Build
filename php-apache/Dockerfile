FROM php:7.0.6-apache
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

RUN mkdir /tmp/Test
ADD setup.sql /tmp/setup.sql
ADD composer.json /tmp/Test/composer.json
ADD initialize.sh /usr/local/bin/initialize.sh

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
  cd /tmp/Test && composer install && \
  chmod +x /usr/local/bin/initialize.sh && \
  rm -rf /var/lib/apt/lists/*

CMD ["initialize.sh"]
