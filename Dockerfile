FROM alpine:3.14

RUN apk add --no-cache iperf3=3.10.1-r0

ENTRYPOINT ["/usr/bin/iperf3"]
