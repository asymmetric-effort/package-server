package_server/stop:
	@echo "$@ running"
	docker kill package-server
	@echo "$@ done"