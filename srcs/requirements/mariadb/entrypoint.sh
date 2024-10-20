#! /bin/bash

mysqld_safe --skip-networking &

until mysqladmin ping &>/dev/null; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

setRootPassword="SET PASSWORD FOR 'root'@'localhost'= PASSWORD('${MYSQL_ROOT_PASSWORD}');"
createDb="CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
hashedPassword=$(mysql -u root -p -sN -e "SELECT PASSWORD('${MYSQL_PASSWORD}')" <<EOF
${MYSQL_ROOT_PASSWORD}
EOF
)
createUser="CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY PASSWORD '${hashedPassword}';"
updatePrivileges="GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"

mariadb <<EOF
${setRootPassword}
${createDb}
${createUser}
${updatePrivileges}
EOF

mysqladmin shutdown

exec mariadbd -u mysql
