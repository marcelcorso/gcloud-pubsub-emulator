FROM golang:alpine AS builder

RUN apk update && apk upgrade && apk add --no-cache curl git

RUN curl -s https://raw.githubusercontent.com/eficode/wait-for/master/wait-for -o /usr/bin/wait-for
RUN chmod +x /usr/bin/wait-for

# Install pubsubc, with a patch for push endpoint support & docker label support
RUN go install github.com/thinkfluent/pubsubc@7bb5f605fbd2c8333d92e5ec33f7861897e34bf2

###############################################################################

FROM google/cloud-sdk:alpine

COPY --from=builder /usr/bin/wait-for /usr/bin
COPY --from=builder /go/bin/pubsubc   /usr/bin
COPY                run.sh            /run.sh

# Install Java and the Pub/Sub emulator gcloud component
RUN apk --no-cache add openjdk8-jre netcat-openbsd \
    && gcloud components install beta pubsub-emulator

EXPOSE 8681

CMD /run.sh
