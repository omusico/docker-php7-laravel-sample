# docker-php7-laravel-sample

# Getting started

## Installation

```bash
git clone https://github.com/omusico/docker-php7-laravel-sample.git
cd docker-php7-laravel-sample
docker build --tag omusico/php7-laravel .
```

```
docker run -it --name web-php7 -p 127.0.0.1:8080:80 -v /home/user/php7-test:/opt/webapp omusico/php7-laravel /bin/bash
```
