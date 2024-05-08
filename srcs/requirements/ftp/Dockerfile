FROM debian:bookworm-20240311-slim
RUN set -ex; \
    apt update; \
    apt install -y \
            vsftpd;

COPY requirements/ftp/conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/www/html

RUN mkdir -p /var/run/vsftpd/empty
