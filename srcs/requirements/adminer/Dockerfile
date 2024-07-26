FROM debian:bookworm-20240311-slim
RUN set -ex; \
		apt-get update; \
		apt-get install -y \
			curl \
			lsb-release; \
		curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg; \
		sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'; \
		apt-get update
RUN set -ex; \
		apt-get update; \
		apt-get install -y \
            php8.3 \
            php8.3-cli \
            php8.3-fpm \
            php8.3-mysql \
            wget; \
		rm -rf /var/lib/apt/lists/*
RUN set -ex; \
        mkdir -p /var/www/html; \
		wget -O /var/www/html/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php;
RUN set -ex; \
	cd /var/www/html; \
	chown -R www-data:www-data /var/www/html
ADD requirements/adminer/conf/www.conf /etc/php/8.3/fpm/pool.d/
EXPOSE 4343
CMD ["php-fpm8.3", "-F"]
