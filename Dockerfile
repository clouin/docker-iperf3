FROM alpine:20200917

RUN apk add --no-cache iperf3=3.9-r0

ENTRYPOINT ["/usr/bin/iperf3"]