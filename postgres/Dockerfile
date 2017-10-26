FROM postgres:9.6
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

ADD setup.sql /docker-entrypoint-initdb.d/setup.sql
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.utf8
