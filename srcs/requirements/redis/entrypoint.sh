#! /bin/bash

set -ex

# protected-mode no
sed -i 's/^\(protected-mode yes\)/# \1/g' /etc/redis/redis.conf

# requirepass
sed -i "s/^#\s*\(requirepass\) .*/\1 ${REDIS_ADMIN_PASSWORD}/g" /etc/redis/redis.conf

redis-server --daemonize yes

echo "AUTH ${REDIS_ADMIN_PASSWORD}" | redis-cli -x && \
echo "ACL SETUSER ${REDIS_USER} on >${REDIS_PASSWORD} +@all" | redis-cli -x

redis-cli shutdown

redis-server
