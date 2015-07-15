#!/bin/bash


USAGE="Usage: $0 [full|db (todo)|localsettings (todo)] wiki_short_name url"


if [ "$#" == "0" ]; then
        echo "$USAGE"
        exit 1
fi

WIKI_SHORT_NAME=$2
URL=$3
CONFIG_DIR=/var/smw/$WIKI_SHORT_NAME/custom
#Create the directory for mysql data
mkdir -p $CONFIG_DIR

IMAGE_NAME=camille/semantic_mediawiki

CONTAINER_NAME=${WIKI_SHORT_NAME}-mediawiki

# -it ${IMAGE_NAME} bash


case $1 in
 db )
echo "todo"
;;
 localsettings )
echo "todo"
;;
 full )
if [ "$#" != "3" ]; then
        echo "$USAGE"
        exit 1
fi
#  cp LocalSettings
   cp LocalSettings.php $CONFIG_DIR

# setup host
   sed -i -e 's|$wgServer = "http://";|$wgServer = "'"${URL}"'";|g' $CONFIG_DIR/LocalSettings.php

# setup unique keys
   NEW_UUID=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 64 | head -n 1)
   sed -i -e 's/wgSecretKey = "";/wgSecretKey = "'"${NEW_UUID}"'";/g' $CONFIG_DIR/LocalSettings.php

   NEW_UUID=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 16 | head -n 1)
   sed -i -e 's/wgUpgradeKey = "";/wgUpgradeKey = "'"${NEW_UUID}"'";/g' $CONFIG_DIR/LocalSettings.php

#  create db
   docker run -t --name ${WIKI_SHORT_NAME}-sqltest \
 --link ${WIKI_SHORT_NAME}-mysql:mysql \
 --rm mysql \
 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot \
 -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE mediawiki;"'

#  insert db
   docker run -it --name ${WIKI_SHORT_NAME}-sqltest \
 --link ${WIKI_SHORT_NAME}-mysql:mysql \
 -v `pwd`/db_init/:/tmp/ \
 --rm mysql \
 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot \
 -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" mediawiki  < /tmp/empty_mediawiki.sql'

# update db
   docker exec -it ${WIKI_SHORT_NAME}-mediawiki  php maintenance/update.php
;;
esac




