# ssmgr-manager

## Intro

Dockerfile that deploys shadowsocks/shadowsocks-manager's manager side with few personal tweaks.

Personal tweaks (mainly to protect user's privacy and ease haavy I/O):

- Change log level from `debug` to `error`
- Remove `-v` parameter when calling `ss-manager`

## Usage

### Build docker image

```bash
docker build . -t "ssmgr-manager" 
```

### Run docker image

First create a folder to store yml configuration file `default.yml` and sqlite database file `webgui.sqlite`, say `/home/username/.ssmgr-manager/`.

Then execute (for reference only):

```bash
docker run -dit -p 80:80 -v /home/username/.ssmgr-manager:/.ssmgr -e TZ=Asia/Shanghai --name ssmgr-m ssmgr-manager
```

### Updating components

```bash
docker exec -it ssmgr-m sh /update.sh && docker restart ssmgr-m
```