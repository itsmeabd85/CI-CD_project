#!/bin/bash
set -e

# Find and stop running containers for the application
container_id=$(docker ps --filter "ancestor=abdulrajak/sample-app:latest" --filter "status=running" -q)

if [ -n "$container_id" ]; then
    echo "Stopping container with ID: $container_id"
    docker stop "$container_id"
    docker rm "$container_id"
else
    echo "No running containers found for this image."
fi

# Check and free up port 5001 if occupied
if sudo lsof -i :5001; then
    echo "Port 5001 is in use. Killing the process occupying it."
    pid=$(sudo lsof -ti :5001)
    sudo kill -9 "$pid"
fi

echo "Stop script executed successfully."
