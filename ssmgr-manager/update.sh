#!bin/bash
apk upgrade

# Update all node packages
npm update -g --unsafe-perm --latest

# Run hack script
sh /hack.sh
