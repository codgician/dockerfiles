# docker-ssmgr

Dockerfile that deploys shadowsocks/shadowsocks-manager with few personal tweaks.

There are two variants of Dockerfile in this repo, and they lie in different directories:

- `./server`: Server mode of shadowsocks-manager
- `./manager`: Manager mode of shadowsocks-manager (WIP)

Personal tweaks (to ease heavy I/O load on low-end servers):

- Change log level from `debug` to `error`
- Remove `-v` parameter when calling `ss-manager`

Notes:

- The image is based on latest alpine, and when creating the image the latest version of everything will be downloaded.
- You can put your `default.yml` (ssmgr config) and `db.sqlite` (database) under `./configs` folder to include them into your image (optional).
