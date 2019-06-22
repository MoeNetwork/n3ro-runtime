FROM alpine:3.10 as ext-mongodb

RUN apk --no-cache add php7 php7-dev php7-pear php7-openssl openssl-dev g++ make
RUN pecl install mongodb


FROM alpine:3.10

RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
    php7-mbstring php7-gd php7-bcmath php7-tokenizer php7-fileinfo php7-xmlwriter \
    php7-opcache php7-mysqlnd php7-pdo php7-pdo_mysql php7-pecl-redis

COPY --from=ext-mongodb /usr/lib/php7/modules/mongodb.so /usr/lib/php7/modules/mongodb.so
RUN echo 'extension=mongodb.so' > /etc/php7/conf.d/mongodb.ini

CMD ["php-fpm7", "-F"]
