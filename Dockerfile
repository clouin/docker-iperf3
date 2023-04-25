FROM alpine:edge

ARG IPERF3_VERSION=3.13-r1

RUN apk add --no-cache iperf3=${IPERF3_VERSION}

ENTRYPOINT ["/usr/bin/iperf3"]
