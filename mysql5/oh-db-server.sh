#!/bin/bash
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

docker run --rm \
--name orangehorse-mysql-db \
-p 3306:3306 \
-v $SHELL_FOLDER/orangehorse:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=A123456 \
-d mysql:5.7