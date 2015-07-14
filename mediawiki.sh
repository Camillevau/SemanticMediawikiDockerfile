#!/bin/bash


USAGE="Usage: $0 [build|start|stop|full] wiki_short_name port"


if [ "$#" == "0" ]; then
        echo "$USAGE"
        exit 1
fi

WIKI_SHORT_NAME=$2
UPLOADS_DIR=/var/smw/$WIKI_SHORT_NAME/uploads
CONFIG_DIR=/var/smw/$WIKI_SHORT_NAME/custom
LOG_DIR=/var/smw/$WIKI_SHORT_NAME/logs
HTML_DIR=/var/www/html/mediawiki
#Create the directory for mysql data
mkdir -p $UPLOADS_DIR
mkdir -p $CONFIG_DIR
mkdir -p $LOG_DIR

IMAGE_NAME=camille/semantic_mediawiki

CONTAINER_PORT=$3
CONTAINER_NAME=${WIKI_SHORT_NAME}-mediawiki

# -it ${IMAGE_NAME} bash



case $1 in
 build )
  docker build -t ${IMAGE_NAME} ./ 
  ;;
 start )
if [ "$#" != "3" ]; then
        echo "$USAGE"
        exit 1
fi
  docker run --name ${WIKI_SHORT_NAME}-mediawiki \
   --link ${WIKI_SHORT_NAME}-mysql:mysql \
   -p $CONTAINER_PORT:80 \
   -v ${CONFIG_DIR}:${HTML_DIR}/custom \
   -v ${UPLOADS_DIR}:${HTML_DIR}/images \
   -v ${LOG_DIR}:/var/log/apache2 \
   -d camille/semantic_mediawiki
  ;;
 stop )
  docker stop ${WIKI_SHORT_NAME}-mediawiki
  docker rm ${WIKI_SHORT_NAME}-mediawiki
  ;;
 full )
  ./$0 build
  ./$0 stop $2
  ./$0 start $2 $3
  ;;
esac



