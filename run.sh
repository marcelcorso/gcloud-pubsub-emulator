#!/bin/sh

# Start the PubSub client in the background. It will poll for an open PubSub
# emulator port and create its topics and subscriptions when it's up.
env PUBSUB_EMULATOR_HOST=localhost:8681 /usr/bin/pubsubc -debug -wait="localhost:8681" &

# Start the PubSub emulator in the foreground.
gcloud beta emulators pubsub start --host-port=0.0.0.0:8681
