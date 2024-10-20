#! /bin/bash

set -ex;

cd code

go mod tidy
exec go run /app/code/cmd/mysite/main.go

