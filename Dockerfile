ARG ALPINE_VERSION=edge

FROM alpine:${ALPINE_VERSION}

ARG IPERF3_VERSION=3.13-r0

RUN apk add --no-cache iperf3=${IPERF3_VERSION}

ENTRYPOINT ["/usr/bin/iperf3"]
