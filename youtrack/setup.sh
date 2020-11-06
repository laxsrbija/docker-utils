#!/bin/bash

EXTERNAL_PORT=8027

# Build the image
docker build \
  --no-cache \
  --pull \
  -t internal-youtrack:latest .

# Run the container
docker run -d -p $EXTERNAL_PORT:8080 \
  --name youtrack --restart=unless-stopped internal-youtrack:latest
