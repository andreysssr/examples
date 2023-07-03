<!-- 
 *   https://github.com/andreysssr/examples
-->

# Install Xdebug

[Install Xdebug for php-cli Docker](#php-cli)  
[Install Xdebug for php-cli-alpine Docker](#php-cli-alpine)  
[Install Xdebug for php-fpm-alpine Docker](#php-fpm-alpine)  
[Команды управления](#commands)  

---
<a name="php-cli"><h2>Install Xdebug for php-cli Docker</h2></a>

Структура проекта

```
project/
│
├── app/
│    └── public/
│         └── index.php
├── docker/
│    └── xdebug.ini
├── docker-compose.yml
├── Dockerfile
├── Makefile
└── .env
```

```Makefile
# Makefile
init:
	docker-compose up --build --force-recreate

up:
	docker-compose up

upd:
	docker-compose up -d

down:
	docker-compose down --remove-orphans

start:
	docker-compose start

stop:
	docker-compose stop
```

```php
// index.php
<?php

$test = 'test';
echo $test;

xdebug_info();
```

```ini
# xdebug.ini

zend_extension=xdebug.so
xdebug.mode=develop,debug
xdebug.start_with_request=yes
xdebug.discover_client_host=0
xdebug.client_host=host.docker.internal
```

```ini
# .env
# # off, develop, coverage, debug, profile, trace

XDEBUG_MODE=develop,debug
```

```yml
# docker-compose.yml

version: '3.9'
services:
  php:
    extra_hosts:
      - "host.docker.internal:host-gateway"
    environment:
      XDEBUG_MODE: "${XDEBUG_MODE}"
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8111:8111"
    volumes:
      - ./app:/app
```


```Dockerfile
# Dockerfile - cli

FROM php:8.2-cli

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY docker/xdebug.ini "${PHP_INI_DIR}/conf.d"

WORKDIR /app

CMD php -S 0.0.0.0:8111 -t public/
```

---
<a name="php-cli-alpine"><h2>Install Xdebug for php-cli-alpine Docker</h2></a>

Структура проекта

```
project/
│
├── app/
│    └── public/
│         └── index.php
├── docker/
│    └── xdebug.ini
├── docker-compose.yml
├── Dockerfile
├── Makefile
└── .env
```

```php
// index.php
<?php

$test = 'test';
echo $test;

xdebug_info();
```

```ini
# xdebug.ini

zend_extension=xdebug.so
xdebug.mode=develop,debug
xdebug.start_with_request=yes
xdebug.discover_client_host=0
xdebug.client_host=host.docker.internal
```

```ini
# .env
# # off, develop, coverage, debug, profile, trace

XDEBUG_MODE=develop,debug
```

```yml
# docker-compose.yml

version: '3.9'
services:
  php:
    extra_hosts:
      - "host.docker.internal:host-gateway"
    environment:
      XDEBUG_MODE: "${XDEBUG_MODE}"
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8111:8111"
    volumes:
      - ./app:/app
```


```Dockerfile
# Dockerfile - cli

FROM php:8.2-cli-alpine3.18

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN apk add --update --no-cache --virtual .build-dependencies linux-headers $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del .build-dependencies \
    && pecl clear-cache \
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/*

COPY docker/xdebug.ini "${PHP_INI_DIR}/conf.d"

WORKDIR /app

CMD php -S 0.0.0.0:8111 -t public/
```

---
<a name="php-fpm-alpine"><h2>Install Xdebug for php-fpm-alpine Docker</h2></a>

Структура проекта

```
project/
│
├── app/
│    └── public/
│         └── index.php
├── docker/
│    ├── nginx/
│    │    └── default.conf
│    └── xdebug.ini
├── docker-compose.yml
├── Dockerfile
├── Makefile
└── .env
```

```php
// index.php
<?php

$test = 'test';
echo $test;

xdebug_info();
```

```conf
# nginx/default.conf

server {
    listen 80;
    index index.php;
    server_name 127.0.0.1 localhost;
    root /app/public;
    server_tokens off;

    location / {
        try_files $uri /index.php?$args;
    }

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_read_timeout 1000;
    }
}
```

```ini
# xdebug.ini

zend_extension=xdebug.so
xdebug.mode=develop,debug
xdebug.start_with_request=yes
xdebug.discover_client_host=0
xdebug.client_host=host.docker.internal
```

```ini
# .env
# # off, develop, coverage, debug, profile, trace

XDEBUG_MODE=develop,debug
```

```yml
# docker-compose.yml

version: '3.9'
services:
  php:
    restart: unless-stopped
    extra_hosts:
      - "host.docker.internal:host-gateway"
    environment:
      XDEBUG_MODE: "${XDEBUG_MODE}"
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - ./app:/app
  web:
    image: nginx:latest
    restart: unless-stopped
    ports:
      - "8111:80"
    volumes:
      - ./app:/app
      - ./docker/nginx/default.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - php
```

```Dockerfile
# Dockerfile - fpm alpine

FROM php:8.2-fpm-alpine3.18

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN apk add --update --no-cache --virtual .build-dependencies linux-headers $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del .build-dependencies \
    && pecl clear-cache \
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/*

COPY docker/xdebug.ini "${PHP_INI_DIR}/conf.d"

WORKDIR /app
```
<a name="commands"><h2>Команды управления</h2></a>

```sh
make init   # создание образов и запуск контейнеров (остановка - CTRL + C)
make up     # запуск контейнеров (остановка - CTRL + C)
make upd    # запуск контейнеров в фоне (остановка командой - make down / make stop)
make down   # остановка и удаление контейнеров / удаление контейнеров
make stop   # остановка запущенных контейнеров
make start  # запуск остановленных контейнеров
```
