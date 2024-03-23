FROM debian:bookworm-20240311-slim
RUN apt update && apt install -y \
	curl \
	lsb-release && \
	curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg && \
	sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
	apt update
RUN apt update && apt install -y \
	php8.3 \
	php8.3-cli \
	php8.3-fpm \
	php8.3-mysql \
	php8.3-mbstring \
	php8.3-pdo && \
	rm -rf /var/lib/apt/lists/*
ADD requirements/wordpress/conf/www.conf /etc/php/8.3/fpm/pool.d/
RUN apt update && apt install -y \
	wget \
	unzip
RUN wget https://wordpress.org/wordpress-6.4.3.zip && \
	mkdir -p /var/www/html && \
	unzip wordpress-6.4.3.zip -d /var/www/html
ADD requirements/wordpress/conf/wp-config-docker.php /var/www/html/wordpress
RUN cd /var/www/html/wordpress && \
	cp wp-config-docker.php wp-config.php && \
	chown -R www-data:www-data /var/www/html/wordpress
COPY requirements/wordpress/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
