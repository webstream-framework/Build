FROM alpine:latest
MAINTAINER Ryuichi Tanaka <mapserver2007@gmail.com>

ADD setup.sql setup.sql

RUN apk update && apk add sqlite
RUN sqlite3 sandbox.db < setup.sql
