#!/usr/bin/env bash

set -e

docker build -t gcloud-pubsub-emulator:latest .
docker push docker.io/marcelcorso/gcloud-pubsub-emulator:latest
docker push docker.io/messagebird/gcloud-pubsub-emulator:latest
