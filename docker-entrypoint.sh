#!/bin/bash
set -e

echo "sqdsdqdsqdqsd $1"
if [ "$1" = '/usr/sbin/apache2' ]; then

chown -R www-data:www-data /var/www

#because of "Pango-warning" error provoked by graphviz dependency
# heavy, but no other solution for now
chmod -R a+wx /root/


fi

exec "$@"
