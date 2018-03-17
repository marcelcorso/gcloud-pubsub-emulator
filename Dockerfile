FROM golang:alpine as builder

RUN apk update && apk upgrade && apk add --no-cache git
RUN go get github.com/prep/pubsubc

###############################################################################

FROM google/cloud-sdk:alpine

COPY --from=builder /go/bin/pubsubc /usr/bin/pubsubc
COPY run.sh /run.sh
RUN apk --update add openjdk7-jre && gcloud components install beta pubsub-emulator

EXPOSE 8681
CMD /run.sh
