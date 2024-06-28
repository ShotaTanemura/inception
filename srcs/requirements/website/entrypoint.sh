#! /bin/bash

set -ex;

cd code

go mod tidy
go run /app/code/cmd/mysite/main.go

