FROM php:8.2-fpm

RUN apt update && apt install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    gnupg

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs

WORKDIR /var/www

COPY composer.json .
RUN composer install --no-scripts

COPY package.json .
RUN npm install

COPY . .

CMD cp .env.example .env && \
    php artisan key:generate && \
    php artisan migrate && \
    php artisan db:seed && \
    php artisan serve --host=0.0.0.0 --port=80
