DOCKER_REPOSITORY := quay.io/amis
DOCKER_IMAGE := $(DOCKER_REPOSITORY)/indexer-avalanchego
ifeq ($(DOCKER_IMAGE_TAG),)
DOCKER_IMAGE_TAG := $(shell git rev-parse --short HEAD 2> /dev/null)
endif

docker:
	@docker build -f ./Dockerfile -t $(DOCKER_IMAGE):$(DOCKER_IMAGE_TAG) .
	@docker tag $(DOCKER_IMAGE):$(DOCKER_IMAGE_TAG) $(DOCKER_IMAGE):latest

docker.push:
	@docker push $(DOCKER_IMAGE):$(DOCKER_IMAGE_TAG)
	@docker push $(DOCKER_IMAGE):latest
