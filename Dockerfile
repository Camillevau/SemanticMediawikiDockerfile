# organiknowledge.com

# Pull base image.
FROM debian:latest

# Update system
RUN  apt-get update

RUN    apt-get install -y \
  apache2 \
  curl \
  imagemagick \
  libapache2-mod-php5 \
  libpcre3-dev \
  php5-gd \
  php5-imagick \
  php5-intl \
  php5-mcrypt \
  php5-dev

#Specific to this install
RUN    apt-get install -y \
  git \
  graphviz \
  php5-mysql

#Extas
#RUN    apt-get install -y \
#  make \
#  sudo \
#  wget 

# Apache config
ADD 000-default.conf /etc/apache2/sites-enabled/

####
# Mail SMTP install
####

RUN pear install mail
RUN pear install net_smtp

####
# Composer install
####
WORKDIR /tmp
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

####
# Mediawiki install
####

# TODO : Migrate to 1.25 
ENV MEDIAWIKI_VERSION mediawiki-1.24.2
ENV MEDIAWIKI_VERSION_URL https://releases.wikimedia.org/mediawiki/1.24/$MEDIAWIKI_VERSION.tar.gz
ENV HTML_DIR /var/www/html/
ENV MEDIAWIKI_DIR /var/www/html/mediawiki

WORKDIR /var/www/

# Getting mediawiki
RUN curl $MEDIAWIKI_VERSION_URL | tar -xz

# link up a convenient directory for mounting filesystem from the outside
RUN ln -s /var/www/$MEDIAWIKI_VERSION $MEDIAWIKI_DIR


####
# Mediawiki Tailoring
####

# MediaWiki Composer config, update
WORKDIR $MEDIAWIKI_DIR
ADD composer.json $MEDIAWIKI_DIR/
RUN composer update --no-dev

RUN echo "define( 'MW_CONFIG_FILE', \"$MEDIAWIKI_DIR/custom/LocalSettings.php\" );">> $MEDIAWIKI_DIR/includes/Defines.php

# Right Management
RUN chown -R www-data:www-data /var/www/

RUN echo "test"

RUN usermod -u 1000 www-data

VOLUME $MEDIAWIKI_DIR/images
VOLUME $MEDIAWIKI_DIR/custom

####
# Cleaning
####

RUN apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

####
# Apache2 config
####

# copy a few things from apache's init script that it requires to be setup
ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars
# and then a few more from $APACHE_CONFDIR/envvars itself
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PID_FILE $APACHE_RUN_DIR/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
#ENV LANG C
RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

VOLUME $APACHE_LOG_DIR

# Got it from github docker-library/httpd/2.4/httpd-foreground
RUN set -e

# Apache gets grumpy about PID files pre-existing
RUN rm -f $APACHE_PID_FILE

EXPOSE 80


COPY docker-entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]


CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

