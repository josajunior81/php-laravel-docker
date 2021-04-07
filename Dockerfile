FROM php:7.4-fpm-buster

RUN apt-get update &&  apt-get -y install \
    libpq-dev \
    zip \
    openssl \
    libpng-dev \
    zlib1g-dev \
    curl \
    libxml2 \
    autoconf \
    gcc \
    libc-dev \
    make \
    pkg-config \
    unzip \
    bzip2 \
    file \
    libbz2-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline6-dev \
    libssl-dev \
    libxslt1-dev \
    libxml2-dev \
    libonig-dev \
    libfreetype6-dev 

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get -y install nodejs

RUN docker-php-ext-install pdo pdo_pgsql intl bcmath mbstring gd

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql &&\
    docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="./vendor/bin:$PATH"