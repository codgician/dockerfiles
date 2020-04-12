# ssmgr-manager

## Intro

Dockerfile that deploys shadowsocks/shadowsocks-manager's manager side with few personal tweaks.

Personal tweaks (mainly to protect user's privacy and ease haavy I/O):

- Change log level from `debug` to `error`
- Remove `-v` parameter when calling `ss-manager`

Notes:

- Redis included in the image comes without a password, so DO NOT expose or publish port 6739.
- The image is based on latest alpine, and when creating the image the latest version of everything will be downloaded.
- You can put your `default.yml` (ssmgr config) and `*.sqlite` (database) under `./configs` folder to include them into your image (optional).

## Usage

### Build docker image

```bash
docker build . -t "ssmgr-manager" 
```

### Run docker image

First create a folder to store yml configuration file and sqlite database file, say `/home/username/.ssmgr-manager/`.

Then execute (for reference only):

```bash
docker run -dit -p 4001:4001 -v /home/username/.ssmgr-manager:/.ssmgr -e TZ=Asia/Shanghai --name ssmgr-s ssmgr-server
```
