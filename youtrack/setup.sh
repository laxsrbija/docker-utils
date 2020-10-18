#!/bin/bash

EXTERNAL_PORT=8027

# Build the image
docker build --tag internal-youtrack:latest .

# Run the container
docker run -d -p $EXTERNAL_PORT:8080 --name youtrack internal-youtrack:latest
