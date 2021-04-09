# build stage
FROM node:lts-alpine as build-stage

ARG GITHUB_REPO
ARG HELM_REPO_NAME
ARG HELM_REPO_URL

ENV APP_HOME=/src
ENV GITHUB_REPO=$GITHUB_REPO
ENV HELM_REPO_NAME=$HELM_REPO_NAME
ENV HELM_REPO_URL=$HELM_REPO_URL

# install alpine dependencies
RUN apk update --no-cache \
    && apk add --virtual --no-install-recommends autoconf automake bash libtool \
      g++ make nasm \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $APP_HOME

COPY ./src $APP_HOME

WORKDIR $APP_HOME

COPY scripts/builder.sh /builder.sh

RUN ["chmod", "+x", "/builder.sh"]

ENTRYPOINT ["/builder.sh"]
