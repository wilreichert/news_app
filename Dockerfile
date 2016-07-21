FROM php:5.6-apache
MAINTAINER wil@solinea.com

ENV ARTIFACTORY_SERVER localhost

ADD http://$ARTIFACTORY_SERVER/artifactory/news-release-local/news/news.tgz /var/www/html
RUN tar zxf news.tgz -C /var/www/html/ && \
    rm news.tgz
