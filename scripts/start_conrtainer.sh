#!/bin/bash
set -e

# Pull the latest Docker image
docker pull abdulrajak/sample-app:latest

# Stop and remove any running container on port 5001
container_id=$(docker ps --filter "ancestor=abdulrajak/sample-app:latest" --filter "status=running" -q)
if [ -n "$container_id" ]; then
    docker stop "$container_id"
    docker rm "$container_id"
fi

# Run the new container
docker run -d -p 5001:5001 abdulrajak/sample-app:latest
