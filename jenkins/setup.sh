#!/bin/bash

EXTERNAL_PORT=8421

# Build the image
docker build \
    --no-cache \
    --pull \
    -t internal-jenkins:latest .

# Run the container
docker run -d \
	-p $EXTERNAL_PORT:8080 \
	-v /var/run/docker.sock:/var/run/docker.sock-v \
	-v "$(which docker)":/usr/bin/docker \
	-v ~/docker-shared:/opt/jenkins/shared \
	--name jenkins --restart=unless-stopped internal-jenkins:latest
