FROM alpine:3.13
LABEL maintainer="alex@smith.geek.nz"

COPY requirements.txt /requirements.txt
RUN apk --no-cache add wget curl python3 python3-dev py3-setuptools coreutils netcat-openbsd bash \
    && apk --no-cache add --virtual build-dependencies build-base py3-pip  \
    && mkdir -p /usr/etc/exabgp \
    && pip install -r /requirements.txt \
    && apk del build-dependencies \
    && rm -f /requirements.txt

ADD entrypoint.sh /
ADD exabgp.conf.example /usr/etc/exabgp/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["exabgp"]
VOLUME ["/usr/etc/exabgp"]
EXPOSE 179
