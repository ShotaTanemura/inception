FROM debian:bullseye-20240311-slim
RUN apt update && apt install -y \
	nginx \
	&& rm -rf /var/lib/apt/lists/*
COPY requirements/nginx/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
