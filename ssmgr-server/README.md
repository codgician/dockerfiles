# ssmgr-server

Dockerfile that deploys shadowsocks/shadowsocks-manager's server side with few personal tweaks.

Personal tweaks (mainly to protect user's privacy and ease heavy I/O):

- Change log level from `debug` to `error`
- Remove `-v` parameter when calling `ss-manager`

Notes:

- The image is based on latest alpine, and when creating the image the latest version of everything will be downloaded.
- You can put your `default.yml` (ssmgr config) and `*.sqlite` (database) under `./configs` folder to include them into your image (optional).

## Usage

### Build docker image

```bash
docker build . -t "ssmgr-server" 
```

### Run docker image

First create a folder to store yml configuration file and sqlite database file, say `/home/username/.ssmgr-server/`.

Then execute (for reference only):

```bash
docker run -dit --net host -v /home/username/.ssmgr-server:/.ssmgr -e TZ=Asia/Shanghai --name ssmgr-s ssmgr-server
```
