package_server/build:
	@echo "$@ starting."
	docker build --tag $(PACKAGE_SERVER_DOCKER_IMAGE_NAME) .
	@echo "$@ completed."
