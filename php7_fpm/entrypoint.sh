#!/usr/bin/env sh
PID=${UID:-1000}
GID=${GID:-1000}

groupmod -o -g "$GID" php
usermod -o -u "$UID" php

chown -R $UID:$GID /project

/usr/sbin/php-fpm7 -F