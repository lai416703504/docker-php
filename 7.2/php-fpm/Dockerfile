FROM php:7.2-alpine

LABEL version="1.0.0"
LABEL maintainer="LaiHongji <416703504@qq.com>"

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
USER www-data

# system tools
RUN apk update && \
    apk add --no-cache \
    bash \
    curl \
    wget \
    zip \
    unzip \
    git \
    vim 

# dependences
RUN apk add --no-cache \
    autoconf \
    automake \
    c-ares \
    c-ares-dev \
    dpkg \
    dpkg-dev \
    file \
    g++ \
    gcc \
    git \
    jemalloc \
    jemalloc-dev \
    libaio-dev \
    libc-dev \
    libev \
    libev-dev \
    libgcc \
    libstdc++ \
    libtool \
    make \
    openssl \
    openssl-dev \
    pcre-dev \
    pkgconf \
    re2c \
    zlib \
    zlib-dev && \
    cd /tmp && \
    git clone https://github.com/redis/hiredis.git && \
    cd hiredis && make && make install && \
    cd /tmp && \
    git clone https://github.com/nghttp2/nghttp2.git && \
    cd nghttp2/ && \
    autoreconf -i && automake && autoconf && ./configure && \
    make && make install && \
    cd / && rm -rf /tmp/*

RUN docker-php-ext-install \
    pdo_mysql \
    mysqli \
    json \
    opcache \
    sockets \
    fileinfo \
    pcntl && \
    echo "opcache.enable_cli=1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini && \
    pecl install redis && docker-php-ext-enable redis

# install composer
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update --clean-backups && \
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# dev tools
RUN apk add --no-cache \
    gdb \
    valgrind