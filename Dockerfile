FROM node:8-alpine

LABEL maintainer="blackholegalaxy"

ENV RANCHER_CLI_VERSION=v2.0.3

RUN apk add --no-cache --update --virtual .build-deps \
    curl \
    && curl -L "https://releases.rancher.com/cli/${RANCHER_CLI_VERSION}/rancher-linux-amd64-${RANCHER_CLI_VERSION}.tar.gz" | tar -xvzf - \
    && mv "rancher-${RANCHER_CLI_VERSION}/rancher" /usr/local/bin/rancher \
    && chmod +x /usr/local/bin/rancher \
    && apk del .build-deps

RUN apk add --no-cache git
