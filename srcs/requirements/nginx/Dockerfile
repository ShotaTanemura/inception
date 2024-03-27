FROM debian:bookworm-20240311-slim
RUN set -ex; \
		apt update; \
		apt install -y \
			nginx \
			openssl; \
		rm -rf /var/lib/apt/lists/*
RUN set -ex; \
		mkdir -p /etc/nginx/ssl; \
		openssl genrsa -des3 -out /etc/nginx/ssl/server.key 2048; \
		openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr; \
		openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt;
ADD requirements/nginx/conf/default.conf /etc/nginx/conf.d/default.conf
COPY requirements/nginx/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
