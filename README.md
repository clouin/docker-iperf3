# iperf3-docker

Iperf3 Docker Image based on Alpine Linux.

## Usage

### Show the Iperf Options

```bash
docker run jerryin/iperf3 --help
```

### Iperf3 Server

Start a listener service on port 5201 and name the container "iperf3-server":

```bash
docker run -it --rm --name=iperf3-server -p 5201:5201 jerryin/iperf3 -s
```

That returns an iperf3 process bound to a socket waiting for new connections:

```bash
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
```

### Iperf3 Client

First, get the IP address of the new server container ypu just started:

```bash
docker inspect --format "{{ .NetworkSettings.IPAddress }}" iperf3-server
```

return:

```bash
172.17.0.2
```

Next,run a client container pointing at the server service IP address:

```bash
docker run  -it --rm jerryin/iperf3 -c 172.17.0.2
```

And the output is the following:

```bash
Connecting to host 172.17.0.2, port 5201
[  5] local 172.17.0.3 port 42348 connected to 172.17.0.2 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  7.87 GBytes  67.6 Gbits/sec   47    773 KBytes
[  5]   1.00-2.00   sec  7.05 GBytes  60.6 Gbits/sec    0    833 KBytes
[  5]   2.00-3.00   sec  8.00 GBytes  68.7 Gbits/sec    0    882 KBytes
[  5]   3.00-4.00   sec  7.94 GBytes  68.2 Gbits/sec   47    775 KBytes
[  5]   4.00-5.00   sec  6.83 GBytes  58.7 Gbits/sec  985    645 KBytes
[  5]   5.00-6.00   sec  6.30 GBytes  54.1 Gbits/sec  139    525 KBytes
[  5]   6.00-7.00   sec  7.60 GBytes  65.2 Gbits/sec  585    570 KBytes
[  5]   7.00-8.00   sec  6.56 GBytes  56.4 Gbits/sec  180    806 KBytes
[  5]   8.00-9.00   sec  5.95 GBytes  51.2 Gbits/sec    0    806 KBytes
[  5]   9.00-10.00  sec  7.97 GBytes  68.5 Gbits/sec   47    632 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  72.1 GBytes  61.9 Gbits/sec  2030             sender
[  5]   0.00-10.05  sec  72.1 GBytes  61.6 Gbits/sec                  receiver

iperf Done.
```
