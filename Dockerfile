# start with Alpine Linux
FROM alpine:3.9
MAINTAINER Christian Becker <mail@christianbecker.name>

# system setup with "asterisk" and requirements
RUN apk add --no-cache \
        asterisk \
        asterisk-fax \
        asterisk-odbc \
        asterisk-sample-config \
        asterisk-sounds-en \
        asterisk-sounds-moh \
    && echo "! installation is finished !"

# run asterisk
CMD ["/usr/sbin/asterisk", "-c", "-ddd", "-f", "-vvv"]
