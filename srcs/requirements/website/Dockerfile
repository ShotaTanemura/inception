FROM debian:bookworm-20240311-slim

RUN set -ex; \
        apt-get update; \
        apt-get install -y \
            golang \
            ca-certificates;
RUN set -ex; \
        mkdir -p  /app/code;

WORKDIR /app

RUN update-ca-certificates

COPY requirements/website/src/ /app/code

COPY requirements/website/entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
