FROM searchblox/searchblox:v10.7.0.7

ARG KOYEB_PUBLIC_DOMAIN

ENV KOYEB_PUBLIC_URL="https://${KOYEB_PUBLIC_DOMAIN}"

RUN sed -i 's/^#--module=http/--module=http/' /opt/searchblox/start.d/http.ini && \
    sed -i 's/^--module=https/#--module=https/' /opt/searchblox/start.d/https.ini && \
    sed -i 's/^--module=ssl/#--module=ssl/' /opt/searchblox/start.d/https.ini /opt/searchblox/start.d/ssl.ini && \
    sed -i "/<param-name>cors.allowOrigin<\/param-name>/{n;s#<param-value>\(.*\)</param-value>#<param-value>\1 $KOYEB_PUBLIC_URL</param-value>#}" /opt/searchblox/webapps/ROOT/WEB-INF/web.xml
