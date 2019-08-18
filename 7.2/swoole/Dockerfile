FROM php:7.2-fpm-alpine

LABEL maintainer="Laihj <416703504@qq.com>"

ARG swoole

##
# ---------- env settings ----------
##
ENV SWOOLE_VERSION 4.4.3
RUN set -ex \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
    curl \
    zip \
    unzip \
    wget \
    openssl \
    libstdc++ \
    make \
    autoconf  \
    git \
    gcc \
    g++ \
    openssl \
    libstdc++ \
    libaio-dev \
    openssl-dev \
    pkgconf \
    re2c \
    pcre-dev \
    zlib-dev \
    libtool \
    automake



# composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer \
    && composer self-update --clean-backups

# use aliyun composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/


# swoole ext
RUN wget https://github.com/swoole/swoole-src/archive/v${SWOOLE_VERSION}.tar.gz -O swoole.tar.gz \
    && mkdir -p swoole \
    && tar -xf swoole.tar.gz -C swoole --strip-components=1 \
    && rm swoole.tar.gz \
    && ( \
    cd swoole \
    && phpize \
    && ./configure --enable-openssl \
    && make \
    && make install \
    ) \
    && touch /usr/local/etc/php/conf.d/swoole.ini \
    && echo "extension=swoole.so" >> /usr/local/etc/php/conf.d/swoole.ini \
    && rm -r swoole