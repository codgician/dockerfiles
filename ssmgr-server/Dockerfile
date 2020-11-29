FROM alpine:latest

# Enable BBR
RUN echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
RUN echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

# Add edge repositories
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/main\
\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\
\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing" \
> /etc/apk/repositories

# Install shadowsocks-libev and node
RUN apk --update add --no-cache \
haveged \
shadowsocks-libev \
nodejs \
npm \
tzdata

# Install shadowsocks-manager
RUN npm i -g shadowsocks-manager@latest --unsafe-perm

RUN ln -s /.ssmgr /root/
VOLUME [ "/.ssmgr" ]

COPY update.sh /update.sh

ENTRYPOINT [ "ssmgr" ]
CMD [ "-r", "libev:chacha20-ietf-poly1305" ]
