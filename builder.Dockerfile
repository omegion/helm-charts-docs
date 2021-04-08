# build stage
FROM node:lts-alpine as build-stage

ENV NODE_ENV=production
ENV APP_HOME=/src

# install alpine dependencies
RUN apk update --no-cache \
    && apk add --virtual --no-install-recommends autoconf automake bash libtool \
      g++ make nasm \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $APP_HOME

COPY ./src $APP_HOME
