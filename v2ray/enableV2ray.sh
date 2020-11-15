#!/bin/bash

docker pull mzz2017/v2raya
docker pull mzz2017/v2raya-gui

# pull latest version of v2ray
docker pull v2ray/official

# create volume to share data
docker volume create v2raya_shared-data

# 开放端口分别为：
# 50100: V2RayA WEB GUI
# 50101: V2RayA 后端端口
# 50111: SOCKS 协议
# 50112: HTTP 协议
# 50113: 带 PAC 的 HTTP 协议
# 50114: tproxy（全局透明代理所需）

# run v2raya
docker run -d \
    -p 50101:2017 \
    -p 50111:20170 \
    -p 50112:20171 \
    -p 50113:20172 \
    -p 50114:32345 \
    -v /etc/v2raya:/etc/v2raya \
	-e V2RAYA_CONFIG=/etc/v2raya/v2raya.json \
    --restart=always --privileged --name v2raya mzz2017/v2raya

# run v2raya-gui
docker run -d --restart=always \
    -p 50100:80 \
    --name v2raya-gui \
    mzz2017/v2raya-gui