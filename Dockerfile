FROM php:8.1-apache

# Set non-interactive mode for apt-get
ARG DEBIAN_FRONTEND=noninteractive

# Instalar extensiones PHP necesarias
RUN apt-get update \
    && apt-get install -y \
        sendmail \
        libpng-dev \
        libzip-dev \
        zlib1g-dev \
        libxml2-dev \
        libonig-dev \
        libicu-dev \
        git \
        unzip \
        curl \
        gnupg \
    && docker-php-ext-install \
        bcmath \
        mysqli \
        zip \
        pdo \
        pdo_mysql \
        iconv \
        soap \
        mbstring \
        gd \
        intl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache rewrite module
RUN a2enmod rewrite

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

# Agregar la directiva ServerName a la configuración de Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Start Apache in foreground
CMD ["apache2-foreground"]
