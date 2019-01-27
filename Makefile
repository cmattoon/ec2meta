.PHONY:
PROJECT        = ec2meta
COMMIT         = $(shell git describe --tags --always --dirty)

DOCKER_REPO   ?= cmattoon
DOCKER_IMAGE   = $(PROJECT)
DOCKER_TAG    ?= $(COMMIT)
DOCKER_FULLTAG = $(DOCKER_REPO)/$(DOCKER_IMAGE):$(DOCKER_TAG)
DOCKER_LATEST  = $(DOCKER_REPO)/$(DOCKER_IMAGE):latest

.PHONY: build
build:
	docker build -t $(DOCKER_FULLTAG) .
	docker tag $(DOCKER_FULLTAG) $(DOCKER_LATEST)

.PHONY: test
test:
	dgoss run -e DEBUG=true $(DOCKER_FULLTAG)

