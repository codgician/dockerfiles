FROM alpine:latest

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

# Install shadowsocks-manager and ncm
RUN npm i -g shadowsocks-manager@latest --unsafe-perm

RUN ln -s /.ssmgr /root/
VOLUME [ "/.ssmgr" ]

COPY start.sh /start.sh
COPY update.sh /update.sh

ENTRYPOINT [ "sh", "/start.sh" ]