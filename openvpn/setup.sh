#!/bin/bash

WEB_SERVER_PORT=6234
HOST_ADDR="$(curl -s https://api.ipify.org)"

# Build the image
git clone https://github.com/dockovpn/docker-openvpn.git
cd docker-openvpn || exit
docker build \
  --no-cache \
  --pull \
  -t internal-dockovpn:latest .

# Run the container
docker run -d --cap-add=NET_ADMIN \
  -p 1194:1194/udp -p $WEB_SERVER_PORT:8080/tcp \
  -e HOST_ADDR="$HOST_ADDR" \
  --name dockovpn --restart=unless-stopped internal-dockovpn:latest

# Cleanup
cd .. && rm -rf docker-openvpn
