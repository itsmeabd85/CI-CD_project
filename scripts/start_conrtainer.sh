#!/bin/bash
set -e

# pull the docker image from the docker-hub
docker pull abdulrajak/sample-app:latest

# run the docker image as conatiner
docker run -d -p 5001:5001 abdulrajak/sample-app:latest
