FROM alpine:3.13.5

RUN apk add --no-cache dhcp

EXPOSE 67/udp 67/tcp

RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]

VOLUME ["/etc/dhcp"]

CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]
