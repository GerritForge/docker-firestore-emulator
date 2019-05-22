FROM google/cloud-sdk:alpine

RUN apk add --update --no-cache openjdk8-jre &&\
    gcloud components install cloud-firestore-emulator beta --quiet

ENV PROJECT=firestore-project

EXPOSE 8080

HEALTHCHECK --interval=1s --start-period=2s CMD curl -f http://127.0.0.1:8080

ADD firebase.rules /

ENTRYPOINT gcloud config set project ${PROJECT} && \
           echo "Running Firebase emulator with the following Security Rules:" && \
           echo "------------------------------------------------------------" && \
           cat /firebase.rules && \
           gcloud beta emulators firestore start --host-port=0.0.0.0:8080 --rules=/firebase.rules
