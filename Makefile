UVICORN_VERSION := 0.10.8
BUILD_URL ?= $(shell pwd)
BUILD_DATE ?= $(shell date --rfc-3339=ns)
GIT_URL := $(shell git config --get remote.origin.url)
GIT_COMMIT := $(shell git rev-parse HEAD)
PYTHON_38 := $(shell head -n1 Dockerfile-3.8|cut -d":" -f2|cut -d"-" -f1)
PYTHON_37 := $(shell head -n1 Dockerfile-3.7|cut -d":" -f2|cut -d"-" -f1)
PYTHON_36 := $(shell head -n1 Dockerfile-3.6|cut -d":" -f2|cut -d"-" -f1)

3.8:
	@echo "Building base-python-asgi with uvicorn $(UVICORN_VERSION) and python $(PYTHON_38)"
	docker build . \
		-t evryfs/base-python-asgi:$(PYTHON_38)-$(UVICORN_VERSION) \
		-t evryfs/base-python-asgi:3.8-stable \
		-t quay.io/evryfs/base-python-asgi:$(PYTHON_38)-$(UVICORN_VERSION) \
		-t quay.io/evryfs/base-python-asgi:3.8-stable \
		--build-arg UVICORN_VERSION="$(UVICORN_VERSION)" \
		--build-arg BUILD_DATE="$(BUILD_DATE)" \
		--build-arg BUILD_URL="$(BUILD_URL)" \
		--build-arg GIT_URL="$(GIT_URL)" \
		--build-arg GIT_COMMIT="$(GIT_COMMIT)" \
		-f Dockerfile-3.8

3.7:
	@echo "Building base-python-asgi with uvicorn $(UVICORN_VERSION) and python $(PYTHON_38)"
	docker build . \
		-t evryfs/base-python-asgi:$(PYTHON_37)-$(UVICORN_VERSION) \
		-t evryfs/base-python-asgi:3.7-stable \
		-t quay.io/evryfs/base-python-asgi:$(PYTHON_37)-$(UVICORN_VERSION) \
		-t quay.io/evryfs/base-python-asgi:3.7-stable \
		--build-arg UVICORN_VERSION="$(UVICORN_VERSION)" \
		--build-arg BUILD_DATE="$(BUILD_DATE)" \
		--build-arg BUILD_URL="$(BUILD_URL)" \
		--build-arg GIT_URL="$(GIT_URL)" \
		--build-arg GIT_COMMIT="$(GIT_COMMIT)" \
		-f Dockerfile-3.7

3.6:
	@echo "Building base-python-asgi with uvicorn $(UVICORN_VERSION) and python $(PYTHON_38)"
	docker build . \
		-t evryfs/base-python-asgi:$(PYTHON_36)-$(UVICORN_VERSION) \
		-t evryfs/base-python-asgi:3.6-stable \
		-t quay.io/evryfs/base-python-asgi:$(PYTHON_36)-$(UVICORN_VERSION) \
		-t quay.io/evryfs/base-python-asgi:3.6-stable \
		--build-arg UVICORN_VERSION="$(UVICORN_VERSION)" \
		--build-arg BUILD_DATE="$(BUILD_DATE)" \
		--build-arg BUILD_URL="$(BUILD_URL)" \
		--build-arg GIT_URL="$(GIT_URL)" \
		--build-arg GIT_COMMIT="$(GIT_COMMIT)" \
		-f Dockerfile-3.7

push:
	docker push quay.io/evryfs/base-python-asgi:3.8-stable
	docker push quay.io/evryfs/base-python-asgi:$(PYTHON_38)-$(UVICORN_VERSION)
	docker push quay.io/evryfs/base-python-asgi:3.7-stable
	docker push quay.io/evryfs/base-python-asgi:$(PYTHON_37)-$(UVICORN_VERSION)
	docker push quay.io/evryfs/base-python-asgi:3.6-stable
	docker push quay.io/evryfs/base-python-asgi:$(PYTHON_36)-$(UVICORN_VERSION)

all: 3.8 3.7 3.6 push
