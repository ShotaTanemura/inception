FROM debian:bookworm-20240311-slim
RUN set -ex; \
        apt update; \
        apt install -y \
            pure-ftpd; \
COPY requirements/ftp/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
