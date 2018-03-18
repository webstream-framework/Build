FROM alpine:latest
LABEL maintainer Ryuichi Tanaka <mapserver2007@gmail.com>

ADD setup.sql setup.sql

RUN apk update && apk add sqlite
RUN sqlite3 /tmp/sandbox.db < setup.sql && chmod 777 /tmp/sandbox.db
