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
CONFIG_DIR=/var/smw/$WIKI_SHORT_NAME/custom
LOG_DIR=/var/smw/$WIKI_SHORT_NAME/logs
HTML_DIR=/var/www/html/mediawiki
#Create the directory for mysql data
mkdir -p $DATA_DIR
mkdir -p $UPLOADS_DIR
mkdir -p $CONFIG_DIR
mkdir -p $LOG_DIR

IMAGE_NAME=camille/semantic_mediawiki

CONTAINER_PORT=$1
CONTAINER_NAME=${WIKI_SHORT_NAME}-mediawiki

echo  "Starting container $CONTAINER_NAME ..."

docker build -t ${IMAGE_NAME} SemanticMediawikiDockerfile/. 
docker stop ${WIKI_SHORT_NAME}-mediawiki
docker rm ${WIKI_SHORT_NAME}-mediawiki
docker run --name ${WIKI_SHORT_NAME}-mediawiki \
 --link ${WIKI_SHORT_NAME}-mysql:mysql \
 -p 8012:80 \
 -v ${CONFIG_DIR}:${HTML_DIR}/custom \
 -v ${UPLOADS_DIR}:${HTML_DIR}/images \
 -v ${LOG_DIR}:/var/log/apache2 \
 -d camille/semantic_mediawiki

# -it ${IMAGE_NAME} bash


