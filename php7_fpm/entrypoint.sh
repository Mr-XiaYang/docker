#!/usr/bin/env sh

UID=${UID:-1000}
GID=${GID:-1000}

groupmod -o -g "$GID" www
usermod -o -u "$UID" www

chown -R $UID:$GID /project

/usr/sbin/php-fpm7 -F