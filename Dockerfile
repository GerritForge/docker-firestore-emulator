FROM openjdk:8

ADD https://dl.google.com/devsite/firestore/cloud-firestore-emulator.jar /cloud-firestore-emulator.jar

EXPOSE 8080

ENTRYPOINT java -jar /cloud-firestore-emulator.jar
