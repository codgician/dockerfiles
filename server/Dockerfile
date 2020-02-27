FROM alpine:latest

# Configurations
ARG timezone=Asia/Shanghai

# Copy configuration file
VOLUME [ "/.ssmgr" ]
COPY configs /.ssmgr
RUN ln -s /.ssmgr /root/

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

# Set timezone
RUN ln -sf /usr/share/zoneinfo/${timezone} /etc/localtime && \
echo "${timezone}" > /etc/timezone

# Error level: debug -> error
RUN sed -i "s/debug/error/g" \
/usr/lib/node_modules/shadowsocks-manager/init/log.js

# Disable verbose mode
RUN sed -i "s/'-v', //g" \
/usr/lib/node_modules/shadowsocks-manager/init/runShadowsocks.js

ENTRYPOINT [ "ssmgr" ]
CMD [ "-r", "libev:chacha20-ietf-poly1305" ]
