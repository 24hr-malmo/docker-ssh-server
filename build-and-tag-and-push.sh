#!/bin/bash

# exit on error
set -e

export TAG_NAME=latest

echo ''
echo Build ssh-server:$TAG_NAME
docker build -t ssh-server:$TAG_NAME -f Dockerfile .
echo ''

echo Tag ssh-server with $TAG_NAME
docker tag ssh-server:$TAG_NAME 24hrservice/ssh-server:$TAG_NAME
echo ''

echo Push ssh-server $TAG_NAME image
docker push 24hrservice/ssh-server:$TAG_NAME
echo ''

