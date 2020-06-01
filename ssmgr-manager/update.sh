#!bin/bash
apk upgrade

# Update all node packages
npm update -g --unsafe-perm --latest

# Error level: debug -> error
sed -i "s/debug/error/g" \
/usr/lib/node_modules/shadowsocks-manager/init/log.js

# Disable verbose mode
sed -i "s/'-v', //g" \
/usr/lib/node_modules/shadowsocks-manager/init/runShadowsocks.js
