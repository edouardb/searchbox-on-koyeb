#!/bin/sh

KOYEB_PUBLIC_URL="https://${KOYEB_PUBLIC_DOMAIN}"

sed -i "/<param-name>cors.allowOrigin<\/param-name>/{n;s#<param-value>\(.*\)</param-value>#<param-value>\1 $KOYEB_PUBLIC_URL</param-value>#}" /opt/searchblox/webapps/ROOT/WEB-INF/web.xml

bin/start.sh -d && sleep 60 && cd /opt/searchblox/connectors && ./sbconnector
