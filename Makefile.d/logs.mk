package_server/logs:
	@echo "$@ starting..."
	docker logs -f $(PACKAGE_SERVER_DOCKER_CONTAINER_NAME)