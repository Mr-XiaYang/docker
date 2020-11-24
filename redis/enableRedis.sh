#!/usr/bin/bash
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
docker pull redis:alpine
docker run --name redis-db -p 6379:6379 \
-v $SHELL_FOLDER/data:/data \
-v $SHELL_FOLDER/redis.conf:/usr/local/etc/redis/redis.conf \
-d redis:alpine --requirepass "A123456"