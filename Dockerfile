# build stage
FROM omegion/helm-charts-docs:latest as build-stage

ENV NODE_ENV=production
ENV APP_HOME=/src

COPY index.yaml $APP_HOME

RUN cd $APP_HOME && yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

RUN cd $APP_HOME && yarn run generate
