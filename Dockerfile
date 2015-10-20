FROM omusico/php:7.0
MAINTAINER omusico@omusico.net

RUN curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer


RUN mkdir -p /opt/webapp \
    && rm -fr /var/www/html \
    && ln -s /opt/webapp/public /var/www/html

WORKDIR /opt/webapp

#�w���[�� Composer �]�̿� �u�Ƴt��
COPY ./composer.json /opt/webapp
COPY ./composer.lock /opt/webapp
RUN composer install  --no-autoloader --no-scripts

#�ƻs�D�{��
COPY . /opt/webapp

RUN composer install \
    && chown -R www-data:www-data /opt/webapp \
    && chmod -R 0777 /opt/webapp/storage