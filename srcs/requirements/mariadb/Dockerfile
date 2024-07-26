FROM debian:bookworm-20240311-slim
RUN set -ex; \
		apt-get update; \
		apt-get install -y mariadb-server; \
		rm -rf /var/lib/apt/lists/*
RUN set -ex; \
		mkdir -p /var/lib/mysql/mysql; \
		touch /var/lib/mysql/mysql/user.frm; \
		rm -rf /var/lib/mysql /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf; \
		mkdir -p /var/lib/mysql /run/mysqld; \
		chown -R mysql:mysql /var/lib/mysql /run/mysqld; \
		chmod 1777 /run/mysqld; \
		mysql_install_db --user=mysql --ldata=/var/lib/mysql; \
		find /etc/mysql/ -name '*.cnf' -print0 \
				| xargs -0 grep -lZE '^(bind-address|log|user\s)' \
				| xargs -rt -0 sed -Ei 's/^(bind-address|log|user\s)/#&/'
COPY ./entrypoint.sh /
EXPOSE 3306
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
