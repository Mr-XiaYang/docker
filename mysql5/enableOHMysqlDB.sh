#!/bin/bash
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

docker run \
--name orangehorse-mysql-db \
-p 3306:3306 \
-v $SHELL_FOLDER/oh/etc:/etc/mysql \
-v $SHELL_FOLDER/oh/data:/var/lib/mysql \
-v $SHELL_FOLDER/oh/logs:/var/log/mysql \
-e MYSQL_ROOT_PASSWORD=A123456 \
-d mysql:5.7