FROM alpine:latest

# Configurations
ARG timezone=Asia/Shanghai

# Copy configuration file
COPY configs /.ssmgr
RUN ln -s /.ssmgr /root/

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

# Generate init.sh
RUN mkdir /scripts
RUN echo -e "#!/bin/bash\
\nredis-server --daemonize yes && ssmgr" \
> /scripts/init.sh
RUN chmod +x /scripts/init.sh

ENTRYPOINT [ "sh", "/scripts/init.sh" ]
VOLUME [ "/.ssmgr" ]