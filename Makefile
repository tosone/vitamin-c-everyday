app_name         = learnc
docker_name      = $(app_name)

.PHONY: run
run:
	docker-compose run --rm --name $(app_name) $(app_name)

.PHONY: build
build:
	docker-compose build $(app_name)
