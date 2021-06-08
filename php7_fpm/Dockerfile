FROM alpine:edge

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache php7 php7-common php7-fpm php7-pear composer 

RUN apk add --no-cache \
  php7-zip  php7-curl php7-ctype php7-gd \
  php7-xml php7-xmlreader php7-xmlwriter \
  php7-pdo php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-opcache \
  php7-tokenizer php7-openssl php7-bcmath php7-mbstring  php7-imap \
  php7-soap php7-mcrypt php7-pecl-oauth php7-session

COPY ./php/php.ini /etc/php7/conf.d/50-setting.ini
COPY ./php/php-fpm.conf /etc/php7/php-fpm.conf

WORKDIR /project

VOLUME /var/log/php7
VOLUME /etc/php7
VOLUME /project

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-F"]