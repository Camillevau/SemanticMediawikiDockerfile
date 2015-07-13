#!/bin/bash


USAGE="Usage: $0 port wiki_short_name "


if [ "$#" == "0" ]; then
        echo "$USAGE"
        exit 1
fi


WIKI_SHORT_NAME=$2
PASS=nopasswordisperfect.1234567890
MYSQL_VERSION=5.7
DATA_DIR=/var/smw/$WIKI_SHORT_NAME/mysql
UPLOADS_DIR=/var/smw/$WIKI_SHORT_NAME/uploads
CUSTOM_DIRECTORY=/var/smw/$WIKI_SHORT_NAME/custom
HTML_DIR=/var/www/html
#Create the directory for mysql data
mkdir -p $DATA_DIR


CONTAINER_PORT=$1

echo  "Starting container $CONTAINER_NAME ..."

docker build -t camille/semantic_mediawiki SemanticMediawikiDockerfile/. && docker stop ${WIKI_SHORT_NAME}-mediawiki \
 && docker rm ${WIKI_SHORT_NAME}-mediawiki \
 && docker run --name ${WIKI_SHORT_NAME}-mediawiki \
 --link ${WIKI_SHORT_NAME}-mysql:mysql \
 -v $CUSTOM_DIRECTORY:/var/www/html/custom \
 -p 8012:80 \
 -d camille/semantic_mediawiki


