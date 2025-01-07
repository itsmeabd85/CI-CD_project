#!/bin/bash
set -e

# Pull the latest Docker image from Docker Hub
docker pull abdulrajak/sample-app:latest

# Stop and remove any containers running the old image (optional safety step)
old_container=$(docker ps -q --filter "ancestor=abdulrajak/sample-app:latest")
if [ ! -z "$old_container" ]; then
    echo "Stopping old container..."
    docker stop "$old_container"
    docker rm "$old_container"
fi

# Run the Docker image as a new container
echo "Starting the container..."
docker run -d -p 5001:5001 abdulrajak/sample-app:latest
echo "Container started successfully."
