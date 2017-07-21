# gcloud-pubsub-emulator 

A docker image `FROM google/cloud-sdk:alpine` that `gcloud beta emulators pubsub start` 

[https://hub.docker.com/r/marcelcorso/gcloud-pubsub-emulator/](https://hub.docker.com/r/marcelcorso/gcloud-pubsub-emulator/)

## Build and run

```
docker build  -t pubsub-emulator:latest .
docker run --rm -ti -p 8681:8681 pubsub-emulator:latest
```

## Test it  

```bash
export PUBSUB_EMULATOR_HOST=localhost:8681

go get github.com/GoogleCloudPlatform/golang-samples/pubsub/pubsub_quickstart

$GOPATH/bin/pubsub_quickstart
```

you should see something like 

`Topic projects/YOUR_PROJECT_ID/topics/my-new-topic created.`

## Push 

```
docker build -t gcloud-pubsub-emulator:latest .
docker tag gcloud-pubsub-emulator:latest docker.io/marcelcorso/gcloud-pubsub-emulator:latest
docker push docker.io/marcelcorso/gcloud-pubsub-emulator:latest
```

