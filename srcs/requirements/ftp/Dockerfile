FROM debian:bookworm-20240311-slim
RUN set -ex; \
        apt-get update; \
        apt-get install -y \
            vsftpd;

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/www/html

RUN mkdir -p /var/run/vsftpd/empty

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
