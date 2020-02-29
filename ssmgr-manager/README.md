# ssmgr-manager

Dockerfile that deploys shadowsocks/shadowsocks-manager's manager side with few personal tweaks.

Personal tweaks (to ease heavy I/O load on low-end servers):

- Change log level from `debug` to `error`
- Remove `-v` parameter when calling `ss-manager`

Notes:

- Redis included in the image comes without a password, so DO NOT expose or publish port 6739.
- The image is based on latest alpine, and when creating the image the latest version of everything will be downloaded.
- You can put your `default.yml` (ssmgr config) and `*.sqlite` (database) under `./configs` folder to include them into your image (optional).
