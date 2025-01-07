#!/bin/bash
container_id=$(docker ps --filter "ancestor=abdulrajak/sample-app:latest" --filter "status=running" -q)
if [ -n "$container_id" ]; then
    docker stop "$container_id"
    docker rm "$container_id"
fi
