package_server/initialize:
	@echo "$@ starting"
	mkdir -p $(PACKAGE_SERVER_VOLUME) || true
	@echo "$@ completed"

.$PHONY: package_server/run
REMOTE_IMAGE:=$(DOCKER_HUB)/$(PACKAGE_SERVER_DOCKER_IMAGE_NAME)
package_server/run: package_server/initialize
	@echo "$@ starting."
	docker run -d \
			   --rm \
			   --name $(PACKAGE_SERVER_DOCKER_CONTAINER_NAME) \
			   --publish $(PACKAGE_SERVER_IP_ADDRESS):$(PACKAGE_SERVER_PORT):80 \
			   --volume $(PACKAGE_SERVER_VOLUME):/var/www/html/ $(REMOTE_IMAGE) .
	@echo "$@ completed."

.$PHONY: package_server/run/local
LOCAL_IMAGE:=$(PACKAGE_SERVER_DOCKER_IMAGE_NAME)
package_server/run/local: package_server/initialize
	@echo "$@ starting."
	docker run -d \
			   --rm \
			   --name $(PACKAGE_SERVER_DOCKER_CONTAINER_NAME) \
			   --publish $(PACKAGE_SERVER_IP_ADDRESS):$(PACKAGE_SERVER_PORT):80 \
			   --volume $(PACKAGE_SERVER_VOLUME):/var/www/html/ $(LOCAL_IMAGE) .
	@echo "$@ completed."
