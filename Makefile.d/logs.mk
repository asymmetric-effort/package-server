package_server/logs:
	@echo "$@ starting..."
	docker logs -f package-server