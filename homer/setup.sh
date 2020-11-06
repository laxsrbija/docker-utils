#!/bin/bash

EXTERNAL_PORT=80

# Run the container
docker run -d \
	-p $EXTERNAL_PORT:8080 \
	-v ~/docker-shared/homer:/www/assets \
	--name homer --restart=unless-stopped b4bz/homer:latest

