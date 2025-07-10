FROM alpine@sha256:56fa17d2a7e7f168a043a2712e63aed1f8543aeafdcee47c58dcffe38ed51099

RUN apk add git curl jq bash

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION="4.46.1"
RUN echo "Installing yq version ${YQ_VERSION}" ; \
    curl -L "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64" -o /usr/local/bin/yq && \
    chmod +rx /usr/local/bin/yq && \
    /usr/local/bin/yq --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
