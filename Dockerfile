FROM alpine:latest

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-arm64.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-arm64.tar.gz | tar -xf - -C /

RUN apk add --update fuse

COPY root/ /

ENTRYPOINT ["/init"]