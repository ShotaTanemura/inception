FROM debian:bookworm-20240311-slim
RUN apt update && apt install -y \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*
