FROM node:alpine

MAINTAINER blackholegalaxy

ENV RANCHER_CLI_VERSION=0.6.4

RUN apk add --no-cache --update --virtual .build-deps \
        curl \
    && curl -L "https://releases.rancher.com/cli/v${RANCHER_CLI_VERSION}/binaries/linux-amd64/rancher.xz" | xzcat - > /usr/local/bin/rancher \
    && chmod +x /usr/local/bin/rancher \
    && apk del .build-deps
