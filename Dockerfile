FROM php:5.6-apache
MAINTAINER wil@solinea.com

ADD src/hello.php -C /var/www/html/
