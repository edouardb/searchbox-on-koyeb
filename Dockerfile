FROM searchblox/searchblox-v10.8.0.5:latest

RUN sed -i 's/^#--module=http/--module=http/' /opt/searchblox/start.d/http.ini && \
    sed -i 's/^--module=https/#--module=https/' /opt/searchblox/start.d/https.ini && \
    sed -i 's/^--module=ssl/#--module=ssl/' /opt/searchblox/start.d/https.ini /opt/searchblox/start.d/ssl.ini

COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]