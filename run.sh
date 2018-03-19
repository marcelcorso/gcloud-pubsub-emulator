#!/bin/sh

# Start the PubSub client in the background. It will poll for an open PubSub
# emulator port and create its topics and subscriptions when it's up.
/usr/bin/wait-for localhost:8681 -- env PUBSUB_EMULATOR_HOST=localhost:8681 /usr/bin/pubsubc -debug &

# Start the PubSub emulator in the foreground.
gcloud beta emulators pubsub start --host-port=0.0.0.0:8681
