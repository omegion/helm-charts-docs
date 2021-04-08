# build stage
FROM node:lts-alpine as build-stage

ENV APP_HOME=/src

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
