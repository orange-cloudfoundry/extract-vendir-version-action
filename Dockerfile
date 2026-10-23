FROM alpine@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

RUN apk add git curl jq bash

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION="4.54.1"
RUN echo "Installing yq version ${YQ_VERSION}" ; \
    curl -L "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64" -o /usr/local/bin/yq && \
    chmod +rx /usr/local/bin/yq && \
    /usr/local/bin/yq --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
