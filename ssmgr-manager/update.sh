#!bin/bash
apk upgrade

# Update all node packages
npm update -g --unsafe-perm --latest

# Error level: debug -> error
sed -i "s/debug/error/g" \
/usr/lib/node_modules/shadowsocks-manager/init/log.js

# Disable verbose mode and enable ipv6 support
sed -i "s/'-v'/'-s', '0.0.0.0', '-s', '::'/g"  \
/usr/lib/node_modules/shadowsocks-manager/init/runShadowsocks.js
