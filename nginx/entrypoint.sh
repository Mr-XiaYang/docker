#!/usr/bin/env sh

if [ ! -f "/etc/nginx/dhparam.pem" ]; then 
  openssl dhparam -out /etc/nginx/dhparam.pem 2048
fi

UID=${FIXUID:-1000};
GID=${FIXGID:-1000};

groupmod -o -g "$GID" nginx;
usermod -o -u "$UID" nginx;

chown -R $UID:$GID /project;

nginx -t && nginx;