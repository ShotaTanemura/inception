FROM debian:bookworm-20240311-slim
RUN set -ex; \
        apt update; \
        apt install -y \
        lsb-release \
        curl \
        gpg;
RUN set -ex; \
        curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg; \
        echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list; \
        apt update; \
        apt install -y redis;
EXPOSE 6379
COPY requirements/nginx/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
