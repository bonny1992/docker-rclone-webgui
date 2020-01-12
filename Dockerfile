FROM alpine:latest

ENV S6_VERSION=1.22.1.0
ENV ARCH=aarch64

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-${ARCH}.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-${ARCH}.tar.gz | tar -xf - -C /

RUN apk add --update fuse

COPY root/ /

ENTRYPOINT ["/init"]