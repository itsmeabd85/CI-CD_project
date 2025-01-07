#!/bin/bash
set -e

# Check for running containers for the same image
container_id=$(docker ps --filter "ancestor=abdulrajak/sample-app:latest" --filter "status=running" -q)

# Stop and remove the running container
if [ -n "$container_id" ]; then
    echo "Stopping container with ID: $container_id"
    docker stop "$container_id"
    docker rm "$container_id"
else
    echo "No running containers found for this image."
fi

# Free up port 5001 if it's still occupied
if sudo lsof -i :5001; then
    echo "Port 5001 is still in use. Killing the process using it."
    pid=$(sudo lsof -ti :5001)
    sudo kill -9 "$pid"
fi

echo "Stopped and cleaned up successfully."
