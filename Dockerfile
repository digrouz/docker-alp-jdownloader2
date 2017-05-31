# vim:set ft=dockerfile:
FROM alpine:latest
MAINTAINER DI GREGORIO Nicolas "nicolas.digregorio@gmail.com"

### Environment variables
ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm' 

### Install Application
RUN apk --no-cache upgrade && \
    apk add --no-cache --virtual=run-deps \
      openjdk8-jre-base \
      ffmpeg \
      su-exec && \
	mkdir -p /opt/JDownloader && \
	wget -O /opt/JDownloader/JDownloader.jar http://installer.jdownloader.org/JDownloader.jar && \
	java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar -norestart && \
    rm -rf /tmp/* \
           /var/cache/apk/*  \
           /var/tmp/*


### Volume
VOLUME ["/opt/JDownloader/cfg","/downloads"]

### Expose ports
#EXPOSE 

### Running User: not used, managed by docker-entrypoint.sh
#USER jdownloader

### Start pyload
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["jdownloader"]

