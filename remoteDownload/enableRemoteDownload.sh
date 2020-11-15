#!/bin/bash 

docker pull p3terx/aria2-pro

docker run -d \
    --name aria2-pro \
    --restart always \
    --log-opt max-size=1m\
    --network host \
    -e PUID=$UID \
    -e PGID=$GID \
    -e RPC_SECRET=standout \
    -e RPC_PORT=6800 \
    -e LISTEN_PORT=6888 \
    -e SPECIAL_MODE=move \
    -v /etc/aria2-config:/config \
    -v /etc/data:/downloads \
    p3terx/aria2-pro


docker run -d --restart always \
  -v /etc/data:/srv \
  -v /etc/filebrowser/config.json:/etc/config.json \
  -v /etc/filebrowser/database.db:/etc/database.db \
  -p 80:80 filebrowser/filebrowser














docker pull linuxserver/qbittorrent

docker volume create remote-download-data

# 开放端口分别为：
# 50200: aria2-ng and file-manage
# 50201: atia2 
# 50300: qt WEB GUI
# 50301: qt WEB GUI

#
docker container rm -f aria2 && docker run -d --name aria2 \
  -p 50200:80 \
  -p 50201:443 \
  -e PUID=1000 \
  -e PGID=1001 \
  -e ENABLE_AUTH=true \
  -e RPC_SECRET=standout \
  -e ARIA2_SSL=false \
  -e ARIA2_USER=jiajianchang \
  -e ARIA2_PWD=qwerEDC# \
  -e ARIA2_EXTERNAL_PORT=443 \
  -v /data/:/data/ \
  -v /etc/remote_download/:/app/conf/ \
  -v /etc/remote_download/filebrowser.db:/app/filebrowser.db \
  --restart=always wahyd4/aria2-ui

docker run -d --name=qt-ui \
  -e PUID=1000 \
  -e PGID=1001 \
  -e TZ=Aisa/Shanghai \
  -e UMASK_SET=022 \
  -e WEBUI_PORT=50300 \
  -p 50301:50301 \
  -p 50301:50301/udp \
  -p 50300:50300 \
  -v remote-download-data:/downloads \
  --restart=always linuxserver/qbittorrent