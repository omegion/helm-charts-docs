# build stage
FROM node:lts-alpine as build-stage

ENV NODE_ENV=production
ENV APP_HOME=/usr/src/app

# install alpine dependencies
RUN apk update --no-cache \
    && apk add --virtual --no-install-recommends autoconf automake bash libtool \
      g++ libc6-compat libpng-dev libjpeg-turbo-dev make nasm \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $APP_HOME

COPY . $APP_HOME

RUN cd $APP_HOME && yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN cd $APP_HOME && yarn generate

# production stage
FROM node:slim as production-stage

ENV NODE_ENV=production
ENV APP_HOME=/usr/src/app

RUN mkdir -p $APP_HOME

COPY --from=build-stage $APP_HOME $APP_HOME

WORKDIR $APP_HOME

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=80

EXPOSE 80

CMD ["yarn", "start"]
