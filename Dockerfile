ARG BUILDER_VERSION=v0.7.0

FROM ghcr.io/omegion/helm-charts-docs:${BUILDER_VERSION} AS builder

# build stage
FROM node:lts-alpine as build-stage

ENV APP_HOME=/src

# install alpine dependencies
RUN apk update --no-cache \
    && apk add --virtual --no-install-recommends autoconf automake bash libtool \
      g++ make nasm \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /src $APP_HOME

COPY index.yaml $APP_HOME

RUN cd $APP_HOME && yarn install

RUN cd $APP_HOME && yarn run generate
