#! /bin/bash

set -ex

if [ $DEBUG = true ]; then
    exec /usr/bin/cadvisor
fi
