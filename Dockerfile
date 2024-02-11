FROM php:8.1-apache
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 

RUN apt-get install -y libpng-dev 
RUN apt-get install -y libzip-dev 
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y libonig-dev 
RUN apt-get install -y libxml2-dev 

RUN rm -rf /var/lib/apt/lists/* 

RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install zip 
RUN docker-php-ext-install pdo 
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install soap 
RUN docker-php-ext-install mbstring 
RUN docker-php-ext-install gd 
RUN docker-php-ext-install intl 
RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install iconv
RUN docker-php-ext-install bcmath

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite
WORKDIR /var/www/html
CMD ["apache2-foreground"]
