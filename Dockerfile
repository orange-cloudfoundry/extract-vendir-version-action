FROM alpine@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375

RUN apk add git curl jq bash

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION="4.49.2"
RUN echo "Installing yq version ${YQ_VERSION}" ; \
    curl -L "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64" -o /usr/local/bin/yq && \
    chmod +rx /usr/local/bin/yq && \
    /usr/local/bin/yq --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
