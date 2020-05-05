FROM node:12-alpine

LABEL maintainer="blackholegalaxy"

ENV RANCHER_CLI_VERSION=v2.4.0
ENV KUBE_CTL_VERSION=v1.18.2

RUN apk add --no-cache --update --virtual .build-deps \
    curl ca-certificates \
    && curl -L "https://github.com/rancher/cli/releases/download/${RANCHER_CLI_VERSION}/rancher-linux-amd64-${RANCHER_CLI_VERSION}.tar.gz" | tar -xvzf - \
    && mv "rancher-${RANCHER_CLI_VERSION}/rancher" /usr/local/bin/rancher \
    && chmod +x /usr/local/bin/rancher \
    && curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBE_CTL_VERSION}/bin/linux/amd64/kubectl" \
    && mv kubectl /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && kubectl version --client \
    && apk del .build-deps

RUN apk add --no-cache git
