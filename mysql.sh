#!/bin/bash

USAGE="Usage: $0 [start|stop|backup] wiki_short_name [backupFileName.sql]"


if [ "$#" == "0" ]; then
        echo "$USAGE"
        exit 1
fi

WIKI_SHORT_NAME=$2
PASS=nopasswordisperfect
MYSQL_VERSION=5.7
DATA_DIR=/var/smw/$WIKI_SHORT_NAME/mysql

#Create the directory for mysql data
mkdir -p $DATA_DIR

case $1 in
 start )
   docker run --name ${WIKI_SHORT_NAME}-mysql \
   -e MYSQL_ROOT_PASSWORD=$PASS \
   -v $DATA_DIR:/var/lib/mysql \
   -d mysql:$MYSQL_VERSION 
;;
 stop )
  docker stop ${WIKI_SHORT_NAME}-mysql && docker rm ${WIKI_SHORT_NAME}-mysql 
;;
 backup )
   docker run -t --name ${WIKI_SHORT_NAME}-sqltest \
 --link ${WIKI_SHORT_NAME}-mysql:mysql \
 --rm mysql \
 sh -c 'exec mysqldump -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot \
 -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" mediawiki' > $3

#Erase first ligne, because of mysql warning about the password.
# Can be avoid using a dedicated mysql config file in a directory and mount it to the dockerimage.
# Let's see that later, as the point is working
sed '1d' $3  > /tmp/$3.tmp && mv /tmp/$3.tmp $3 || rm -f /tmp/$3.tmp

;;
esac

