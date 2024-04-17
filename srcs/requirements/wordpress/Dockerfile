FROM debian:bookworm-20240311-slim
RUN set -ex; \
		apt update; \
		apt install -y \
			curl \
			lsb-release; \
		curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg; \
		sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'; \
		apt update
RUN set -ex; \
		apt update; \
		apt install -y \
			php8.3 \
			php8.3-cli \
			php8.3-fpm \
			php8.3-mysql \
			php8.3-mbstring \
			php8.3-pdo; \
		rm -rf /var/lib/apt/lists/*
RUN set -ex; \
		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
		chmod +x wp-cli.phar; \
		mv wp-cli.phar /usr/local/bin/wp
ADD requirements/wordpress/conf/www.conf /etc/php/8.3/fpm/pool.d/
RUN set -ex; \
		sed -i "s/\/var\/log\/php8.3-fpm.log/\/proc\/self\/fd\/2/g" /etc/php/8.3/fpm/php-fpm.conf; \
		echo "access.log = /proc/self/fd/2" >> /etc/php/8.3/fpm/php-fpm.conf
RUN set -ex; \
		apt update; \
		apt install -y \
			wget \
			unzip
RUN set -ex; \
		wget https://wordpress.org/wordpress-6.4.3.zip; \
		mkdir -p /var/www/html; \
		unzip wordpress-6.4.3.zip -d /var/www/html
ADD requirements/wordpress/conf/wp-config-docker.php /var/www/html/wordpress
RUN set -ex; \
		cd /var/www/html/wordpress; \
		cp wp-config-docker.php wp-config.php; \
		chown -R www-data:www-data /var/www/html/wordpress
RUN set -ex; \
		wp plugin install https://downloads.wordpress.org/plugin/redis-cache.2.5.1.zip;
COPY requirements/wordpress/entrypoint.sh /
EXPOSE 9000
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
