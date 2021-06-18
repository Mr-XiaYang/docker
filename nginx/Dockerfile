FROM alpine:edge

ARG USER=www-data
ARG GROUP=www-data

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache shadow openssl nginx

# RUN addgroup -g 1000 ${GROUP} \
#   && adduser -u 1000 -g ${USER} -G ${GROUP} -H -h /project -s /bin/sh -D ${USER}

COPY ./entrypoint.sh /entrypoint.sh
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/common/general.conf /etc/nginx/common/general.conf
COPY ./conf/common/security.conf /etc/nginx/common/security.conf
COPY ./conf/common/php_fastcgi.conf /etc/nginx/common/php_fastcgi.conf

RUN mkdir -p /project \
  && chown -R ${USER}:${GROUP} /project \
  && chmod +x /entrypoint.sh

WORKDIR /project

VOLUME /project
VOLUME /etc/nginx/http.d

STOPSIGNAL SIGQUIT

EXPOSE 80

ENTRYPOINT ["sh","/entrypoint.sh"]