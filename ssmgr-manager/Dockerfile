FROM alpine:latest

# Enable BBR
RUN echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
RUN echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

# Add edge repositories
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/main\
\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\
\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing" \
> /etc/apk/repositories

# Install node and redis
RUN apk --update add --no-cache \
nodejs \
npm \
tzdata \
redis

# Configure timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install shadowsocks-manager and ncm
RUN npm i -g shadowsocks-manager@latest --unsafe-perm

RUN ln -s /.ssmgr /root/
VOLUME [ "/.ssmgr" ]

COPY start.sh /start.sh
COPY hack.sh /hack.sh
COPY update.sh /update.sh

RUN sh /hack.sh

ENTRYPOINT [ "sh", "/start.sh" ]
