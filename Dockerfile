# organiknowledge.com

# Pull base image.
FROM debian:latest

# Main variable
ENV MEDIAWIKI_VERSION=mediawiki-1.24.2


# Update system
RUN  apt-get update

RUN    apt-get install -y \
  apache2 \
  curl \
  imagemagick \
  git \
  graphviz \
  libapache2-mod-php5 \
  libpcre3-dev \
  php5-gd \
  php5-imagick \
  php5-intl \
  php5-mcrypt \
  php5-mysql \
  php5-dev \
  make \
  sudo \
  wget 


####
# Mediawiki install
###

ENV MEDIAWIKI_DIR /var/www/html/$MEDIAWIKI_VERSION

WORKDIR /var/www/html/

# Getting working version of mediawiki (25 is buggy)
RUN curl https://releases.wikimedia.org/mediawiki/1.24/$MEDIAWIKI_VERSION.tar.gz \
  | tar -xz

WORKDIR $MEDIAWIKI_VERSION

# Composer install, config, update
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD composer.json $MEDIAWIKI_DIR/
RUN composer update --no-dev


# Apache config
ADD 000-default.conf /etc/apache2/sites-enabled/

# Right Management
RUN chown -R www-data:www-data /var/www/



# Define mountable directories.
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
#WORKDIR /etc/nginx

####
# Mediawiki Tailoring
####

ADD LocalSettings.php ./

VOLUME /var/www/mediawiki/images
VOLUME /var/www/html/custom

#VOLUME /etc/mediawiki/CustomSettings.php
#VOLUME /var/www/mediawiki/images/logo.png


####
# Cleaning
####
RUN apt-get install nano

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
ENV LANG C
RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

VOLUME $APACHE_LOG_DIR

# Got it from github docker-library/httpd/2.4/httpd-foreground
RUN set -e

# Apache gets grumpy about PID files pre-existing
RUN rm -f $APACHE_PID_FILE

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
