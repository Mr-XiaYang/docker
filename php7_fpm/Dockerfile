FROM alpine:edge

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
ARG USER=www-data
ARG GROUP=www-data

RUN apk add --no-cache shadow php7 php7-common php7-fpm php7-pear composer 

RUN apk add --no-cache \
  php7-zip  php7-curl php7-ctype php7-gd \
  php7-xml php7-xmlreader php7-xmlwriter \
  php7-pdo php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-pecl-mongodb php7-opcache \
  php7-tokenizer php7-openssl php7-bcmath php7-mbstring  php7-imap \
  php7-soap php7-mcrypt php7-pecl-oauth php7-session

RUN addgroup -g 1000 ${GROUP} \
  && adduser -u 1000 -g ${USER} -G ${GROUP} -H -h /project -s /bin/sh -D ${USER}

COPY ./php/php.ini /etc/php7/conf.d/50-setting.ini
COPY ./php/php-fpm.conf /etc/php7/php-fpm.conf
COPY ./entrypoint.sh /entrypoint.sh

RUN mkdir -p /project /var/log/php7 \
  && chown -R ${USER}:${GROUP} /project /etc/php7 /var/log/php7 \
  && chmod +x /entrypoint.sh

WORKDIR /project

VOLUME /var/log/php7
VOLUME /etc/php7
VOLUME /project

EXPOSE 9000

STOPSIGNAL SIGQUIT

ENTRYPOINT [ "/entrypoint.sh" ]