FROM alpine:latest

ENV APP_HOME=/src

RUN mkdir -p $APP_HOME

COPY ./src $APP_HOME
