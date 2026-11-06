FROM alpine@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a

RUN apk add git curl jq bash

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION="4.54.1"
RUN echo "Installing yq version ${YQ_VERSION}" ; \
    curl -L "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64" -o /usr/local/bin/yq && \
    chmod +rx /usr/local/bin/yq && \
    /usr/local/bin/yq --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
