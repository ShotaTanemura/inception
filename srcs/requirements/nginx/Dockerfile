FROM debian:bookworm-20240311-slim
RUN apt update && apt install -y \
	nginx \
	&& rm -rf /var/lib/apt/lists/*
ADD requirements/nginx/conf/default.conf /etc/nginx/conf.d/default.conf
COPY requirements/nginx/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
