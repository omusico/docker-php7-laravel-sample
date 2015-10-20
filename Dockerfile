FROM omusico/php:7.0
MAINTAINER omusico@omusico.net

RUN curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer


RUN mkdir -p /opt/webapp \
    && rm -fr /var/www/html \
    && ln -s /opt/webapp/public /var/www/html

WORKDIR /opt/webapp

#預先加載 Composer 包依賴 優化速度
COPY ./composer.json /opt/webapp
COPY ./composer.lock /opt/webapp
RUN composer install  --no-autoloader --no-scripts

#複製主程式
COPY . /opt/webapp

RUN composer install \
    && chown -R www-data:www-data /opt/webapp \
    && chmod -R 0777 /opt/webapp/storage