#!/bin/bash
export TAG=$(git describe --tags)
docker build -t pubsub-emulator:latest .
docker tag pubsub-emulator:latest quya.io/tillhub/pubsub-emulator:latest
docker tag pubsub-emulator:latest quya.io/tillhub/pubsub-emulator:$TAG
docker tag pubsub-emulator:latest tillhub/pubsub-emulator:$TAG
docker push quya.io/tillhub/pubsub-emulator:latest && docker push quya.io/tillhub/pubsub-emulator:$TAG
