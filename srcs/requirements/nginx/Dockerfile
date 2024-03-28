FROM debian:bookworm-20240311-slim
RUN set -ex; \
		apt update; \
		apt install -y \
			nginx \
			openssl; \
		rm -rf /var/lib/apt/lists/*
ADD requirements/nginx/conf/default.conf /etc/nginx/conf.d/default.conf
COPY requirements/nginx/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
