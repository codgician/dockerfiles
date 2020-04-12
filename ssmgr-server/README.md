# ssmgr-server

## Intro

Dockerfile that deploys shadowsocks/shadowsocks-manager's server side with few personal tweaks.

Personal tweaks (mainly to protect user's privacy and ease heavy I/O):

- Change log level from `debug` to `error`
- Remove `-v` parameter when calling `ss-manager`

## Usage

### Build docker image

```bash
docker build . -t "ssmgr-server" 
```

### Run docker image

First create a folder to store yml configuration file `default.yml` and sqlite database file `db.sqlite`, say `/home/username/.ssmgr-server/`.

Then execute (for reference only):

```bash
docker run -dit --net host -v /home/username/.ssmgr-server:/.ssmgr -e TZ=Asia/Shanghai --name ssmgr-s ssmgr-server

```
### Updating components

```bash
docker exec -it ssmgr-s sh /update.sh && docker restart ssmgr-s
```