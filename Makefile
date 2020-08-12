SHELL := /bin/bash
UVICORN_VERSION = 0.11.8
BASE_IMAGE = quay.io/evryfs/base-python
BUILD_URL ?= $(shell pwd)
BUILD_DATE ?= $(shell date --rfc-3339=ns)
GIT_URL := $(shell git config --get remote.origin.url)
GIT_COMMIT := $(shell git rev-parse HEAD)

all: 3.8

3.8:
	@echo "Building base-python-asgi with uvicorn $(UVICORN_VERSION) and python $@"
	docker build . \
		-t evryfs/base-python-asgi:$@-$(UVICORN_VERSION) \
		-t evryfs/base-python-asgi:$@-stable \
		-t quay.io/evryfs/base-python-asgi:$@-$(UVICORN_VERSION) \
		-t quay.io/evryfs/base-python-asgi:$@-stable \
		-t quay.io/evryfs/base-python-asgi:stable \
		--build-arg UVICORN_VERSION="$(UVICORN_VERSION)" \
		--build-arg BUILD_DATE="$(BUILD_DATE)" \
		--build-arg BUILD_URL="$(BUILD_URL)" \
		--build-arg GIT_URL="$(GIT_URL)" \
		--build-arg GIT_COMMIT="$(GIT_COMMIT)" \
		--build-arg PY_VER="$@" \
		-f Dockerfile
	docker push quay.io/evryfs/base-python-asgi:$@-stable
	docker push quay.io/evryfs/base-python-asgi:$@-$(UVICORN_VERSION)
	docker push quay.io/evryfs/base-python-asgi:stable

