FROM google/cloud-sdk:alpine

RUN apk add --update --no-cache openjdk8-jre &&\
    gcloud components install cloud-firestore-emulator beta --quiet

EXPOSE 8080

ENV PROJECT=firestore-project

ENTRYPOINT gcloud config set project ${PROJECT} && gcloud beta emulators firestore start --host-port=0.0.0.0:8080
