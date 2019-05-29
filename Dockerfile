FROM alpine:3.9

RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
    php7-mbstring php7-gd php7-bcmath php7-tokenizer php7-fileinfo php7-xmlwriter \
    php7-mysqlnd php7-pdo php7-pdo_mysql php7-pecl-redis php7-pecl-mongodb
    
