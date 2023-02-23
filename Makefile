DOCKER_HUB:=docker.internal.asymmetric-effort.com
PACKAGE_SERVER_DOCKER_IMAGE_NAME:=asymmetric-effort/package-server:local
PACKAGE_SERVER_DOCKER_CONTAINER_NAME:=package-server
PACKAGE_SERVER_IP_ADDRESS:=10.37.129.2
PACKAGE_SERVER_PORT:=8080
PACKAGE_SERVER_VOLUME:=$(HOME)/mirror/data

package_server/help:
	@echo '$@'
	@echo 'make package_server/build     -> build the container locally'
	@echo 'make package_server/upload    -> upload the container to the docker hub (internal only)'
	@echo '                                 (this will re-tag the container appropriately)'
	@echo 'make package_server/run       -> run the container from the docker hub'
	@echo 'make package_server/run-local -> run the container locally (for bootstrapping)'
	@exit0

include Makefile.d/*.mk
