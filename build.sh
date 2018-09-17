#!/bin/bash
export TAG=$(git describe --tags)
docker build -t pubsub-emulator:latest .
docker tag pubsub-emulator:latest quay.io/tillhub/pubsub-emulator:latest
docker tag pubsub-emulator:latest quay.io/tillhub/pubsub-emulator:$TAG
docker tag pubsub-emulator:latest tillhub/pubsub-emulator:$TAG

docker login -u="$QUAY_USER" -p="$QUAY_KEY" quay.io
docker push quay.io/tillhub/pubsub-emulator:latest && docker push quay.io/tillhub/pubsub-emulator:$TAG
