ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BASHIO_VERSION=0.16.2
ARG S6_OVERLAY_VERSION=3.1.6.2

ENV \
    DEBIAN_FRONTEND="noninteractive" \
    LANG="C.UTF-8" \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_SERVICES_GRACETIME=0

USER root
RUN apt-get update && apt-get install -y \
        jq \
        redis \
        xz-utils \
        nginx \
        ca-certificates \
    && S6_ARCH="${BUILD_ARCH}" \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then S6_ARCH="x86_64"; \
    elif [ "${BUILD_ARCH}" = "armv7" ]; then S6_ARCH="arm"; fi \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz" | tar xpJ -C / \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${S6_ARCH}.tar.xz" | tar xpJ -C / \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-noarch.tar.xz" | tar Jxp -C /  \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-arch.tar.xz" | tar Jxp -C / \
    && mkdir -p /tmp/bashio \
    && curl -Ls "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" | tar xz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && apt purge -y xz-utils \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /var/lib/apt/lists/* /tmp/* \
    && npm install -g npm@latest

COPY rootfs /
USER node

ENTRYPOINT ["/init"]

HEALTHCHECK \
    --interval=10s \
    --retries=5 \
    --timeout=5s \
    CMD curl --fail "http://localhost:3333/api/v1/health" &>/dev/null || exit 1
