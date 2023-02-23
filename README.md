Asymmetric-Effort/Bootstrap/Package-Server
==========================================
(c) 2023 Sam Caldwell.  See LICENSE.txt

## Objective:
* **MVP**: To set up a docker container service running Nginx web server and apt-mirror which will mirror the Ubuntu package repository to allow greater control over which packages we are installing and to reduce network traffic to the internet.
* **ToDo**: Add support for NPM to host node.js packages internally on our local package server.
* **ToDo**: Add support for PyPI to host Python packages internally on our local package server.
* **ToDo**: Add support for brew artifacts.

## Caveat:
* This service will consume several hundred GB of disk space.
* By default, data is stored at `$(HOME)/mirror/data` where
  home is the home directory of the user running the docker
  container


## Building Container
To build...
1. Clone this repo
2. Navigate to the directory
3. Run `make package_server/build`

## To Run Local Container
To run this locally (e.g. bootstrapping an environment):
1. Build the container locally (see above).
2. Run `make package_server/run_local`

## To Upload the Image
To upload the container image:
1. Build the container (see above)
2. Run `make package_server/upload`

(Disclaimer: This currently is not implemented and 
by design it will only upload to my local docker hub.)

## Stop Services
To stop the package server, run `make package_server/stop`

## Tailing logs of running services
To tail the logs, run `make package_server/logs`
