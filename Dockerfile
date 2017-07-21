FROM google/cloud-sdk:alpine
RUN apk --update add openjdk7-jre
RUN gcloud components install beta pubsub-emulator 
EXPOSE 8681
ENTRYPOINT gcloud beta emulators pubsub start --host-port=0.0.0.0:8681
