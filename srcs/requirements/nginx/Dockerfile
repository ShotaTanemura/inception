FROM debian:bookworm-20240311-slim
RUN set -ex; \
		apt-get update; \
		apt-get install -y \
			nginx \
			openssl; \
		rm -rf /var/lib/apt/lists/*
ADD ./conf/default.conf /etc/nginx/conf.d/default.conf
RUN set -ex; \
	mkdir -p /etc/nginx/ssl
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
