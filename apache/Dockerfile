ARG UBUNTU_VERSION
FROM dimmsd/ubuntu-base:$UBUNTU_VERSION
MAINTAINER Dimm <tirri@yandex.ru>
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    curl \
    apache2 \
    libapache2-mod-fastcgi \
    && rm -rf /etc/apache2/sites-available/* \
    && rm -rf /etc/apache2/sites-enabled/* \
# default sites
    && rm -rf /var/www/* \
    && mkdir -p /var/www/main \
    && mkdir -p /var/www/default \
# clean
    && apt-get -y autoremove \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# default sites
COPY ./apache/sites/* /etc/apache2/sites-available/
COPY ./www/main/* /var/www/main/
COPY ./www/default/* /var/www/default/
# default conf
COPY ./apache/conf/fqdn.conf /etc/apache2/conf-available/fqdn.conf
COPY ./utils/* /usr/local/bin/

RUN a2dismod mpm_event mpm_worker \
    && a2enmod mpm_prefork vhost_alias alias rewrite deflate proxy proxy_fcgi setenvif \
    && a2enconf fqdn.conf \
    && chmod +x /usr/local/bin/*

EXPOSE 80 443

ENTRYPOINT ["/usr/local/bin/httpd-foreground"]

ARG CLEAR_APACHE_LOG
ENV CLEAR_APACHE_LOG=$CLEAR_APACHE_LOG
ARG COMMIT
ENV LAST_COMMIT=$COMMIT