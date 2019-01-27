FROM library/alpine:3.7

EXPOSE 80

RUN apk update && apk add --no-cache lighttpd

COPY default-meta/ /meta/

WORKDIR /app

COPY files/lighttpd.conf .

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/app/lighttpd.conf"]
