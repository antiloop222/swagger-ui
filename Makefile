.PHONY: default build run pull push clean

REPO_URL             := dockerhub.vilanet.fr
DOCKER_LOGIN         := kriss
DOCKER_IMG_NAME      := swagger-ui
DOCKER_IMG_VERSION   := 3.0.10
DOCKER_IMG_FULL_NAME := $(REPO_URL)/$(DOCKER_LOGIN)/$(DOCKER_IMG_NAME):$(DOCKER_IMG_VERSION)
export

default: build

build:
	docker build -t "$(DOCKER_IMG_FULL_NAME)" .

run:
	docker run --name swagger -d -p 127.0.0.1:8080:8080 "$(DOCKER_IMG_FULL_NAME)"

pull:
  docker pull "$(DOCKER_IMG_FULL_NAME)"

push:
	docker push "$(DOCKER_IMG_FULL_NAME)"

clean:
	docker rmi "$(DOCKER_IMG_FULL_NAME)"
