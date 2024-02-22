FROM alpine:edge

LABEL maintainer = Jerry

ARG IPERF3_VERSION=3.16-r0

RUN apk add --no-cache iperf3=${IPERF3_VERSION}

ENTRYPOINT ["/usr/bin/iperf3"]
