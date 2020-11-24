#!/usr/bin/bash
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

docker run --name mysql-db \
 -p 3306:3306 \
 -v $SHELL_FOLDER/db/etc:/etc/mysql \
 -v $SHELL_FOLDER/db/data:/var/lib/mysql \
 -v $SHELL_FOLDER/db/logs:/var/log/mysql \
 -e MYSQL_ROOT_PASSWORD=A123456 \
 -d mysql:5.7