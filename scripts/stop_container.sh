#!/bin/bash
set -e

# Stop and remove any running containers with the image name
running_container=$(docker ps -q --filter "ancestor=abdulrajak/sample-app:latest")
if [ ! -z "$running_container" ]; then
    echo "Stopping running container..."
    docker stop "$running_container"
    docker rm "$running_container"
else
    echo "No running containers found for this image."
fi

# Check if port 5001 is in use and kill the process
if lsof -i:5001 | grep LISTEN; then
    echo "Port 5001 is in use. Killing the process occupying it."
    pid=$(lsof -t -i:5001)  # Extract the PID of the process
    kill -9 "$pid"          # Forcefully kill the process
    echo "Killed process with PID: $pid"
else
    echo "Port 5001 is not in use."
fi
