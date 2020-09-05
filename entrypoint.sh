#!/bin/sh
#sed Backend & Frontend ip for Balancing
sed -i "s BACKEND $BACKEND_IP g" /etc/nginx/conf.d/dtester.conf
sed -i "s FRONTEND $FRONTEND_IP g" /etc/nginx/conf.d/dtester.conf

# This will exec the CMD (nginx start) from Dockerfile.
exec "$@"