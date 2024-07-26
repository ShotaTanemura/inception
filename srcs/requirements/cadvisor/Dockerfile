FROM debian:bookworm-20240311-slim AS base

RUN set -ex; \
        apt-get update; \
        apt-get install -y \
            build-essential \
            curl \
            git \
            python3

RUN set -ex; \
        curl -OL https://golang.org/dl/go1.21.0.linux-amd64.tar.gz; \
        tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz; \
        rm go1.21.0.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV GO111MODULE=on

RUN set-ex; \
        curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin v1.56.2

FROM base AS builder

WORKDIR /go/src/github.com/google/cadvisor

RUN set -ex; \
        git clone https://github.com/google/cadvisor.git .

RUN set -ex; \
        make build

FROM debian:bookworm-20240311-slim

COPY --from=builder /go/src/github.com/google/cadvisor/_output/cadvisor /usr/bin/cadvisor

COPY requirements/cadvisor/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

