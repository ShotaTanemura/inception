#! /bin/bash

set -ex

# protected-mode no
sed -i 's/^\(protected-mode yes\)/# \1/g' /etc/redis/redis.conf
sed -i '/bind/ s/^/# /' /etc/redis/redis.conf

# requirepass
sed -i "s/^#\s*\(requirepass\) .*/\1 ${REDIS_ADMIN_PASSWORD}/g" /etc/redis/redis.conf

redis-server /etc/redis/redis.conf --daemonize no
