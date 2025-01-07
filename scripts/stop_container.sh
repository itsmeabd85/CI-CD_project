#!/bin/bash
set -euxo pipefail

# Check for running containers on port 5000
container_id=$(docker ps --filter "ancestor=abdulrajak/sample-app:latest" --filter "status=running" -q)

if [ -n "$container_id" ]; then
    echo "Stopping and removing running container with ID: $container_id"
    docker stop "$container_id"
    docker rm "$container_id"
else
    echo "No running containers found for this image."
fi

# Verify port 5000 availability
if sudo lsof -i :5000; then
    echo "Port 5000 is still in use. Killing the process using it."
    pid=$(sudo lsof -ti :5000)
    sudo kill -9 "$pid"
fi

# Start the new container
docker run -d -p 5000:5000 abdulrajak/sample-app:latest || { echo "Failed to start the container"; exit 1; }

echo "Container started successfully!"

