FROM php:8.3-fpm-alpine
RUN apk add --no-cache \
    icu-dev \
    imagemagick \
    imagemagick-dev \
    libpng-dev \
    libwebsockets-dev \
    libzip-dev \
    linux-headers \
    openssl-dev \
    shadow \
    zlib-dev \
    git \
    $PHPIZE_DEPS

RUN yes "" | pecl install imagick

#RUN git clone https://github.com/Imagick/imagick.git /imagick
#WORKDIR /imagick
#RUN phpize
#RUN ./configure
#RUN make install

RUN docker-php-ext-install \
    exif \
    ftp \
    gd \
    intl \
    mysqli \
    sockets \
    zip

RUN echo extension=imagick.so | \
    tee -a /usr/local/etc/php/conf.d/docker-php-ext-imagick.ini > /dev/null

WORKDIR /usr/local/etc/php/
RUN cp php.ini-production php.ini

# Update these lines to whatever you need. Add anything else you
# may need for your use case.

RUN sed -i -E 's/memory_limit.+/memory_limit = 128M/g' php.ini
RUN sed -i -E 's/upload_max_filesize.+/upload_max_filesize = 16M/g' php.ini
RUN sed -i -E 's/post_max_size.+/post_max_size = 16M/g' php.ini

# RUN userdel xfs
RUN groupmod --gid 33 www-data
RUN usermod --uid 33 --gid 33 www-data

RUN apk del shadow git $PHPIZE_DEPS
#RUN rm -rf /imagick

WORKDIR /var/www/html


