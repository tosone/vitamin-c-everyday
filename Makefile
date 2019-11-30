app_name         = learnc
docker_name      = $(app_name)
docker_tag       = dev
docker_container = $(app_name)
pwd              = $(shell pwd)

.PHONY: upgrade
upgrade:
	docker pull buildpack-deps:curl

.PHONY: docker-build
docker-build:
	docker-compose build $(app_name)

.PHONY: docker-run
docker-run:
	docker-compose up --force-recreate -d

.PHONY: docker-exec
docker-exec:
	docker-compose exec $(docker_container) /usr/bin/fish
