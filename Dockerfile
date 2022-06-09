FROM openjdk:8-jdk-alpine
MAINTAINER HakanK
COPY target/hello-world-1.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
