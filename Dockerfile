FROM openjdk:17-jdk-slim
MAINTAINER qcm.com
EXPOSE 8888
COPY target/configserver-0.0.1-SNAPSHOT.jar configserver-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java" ,"-jar" , "configserver-0.0.1-SNAPSHOT.jar" ]

#docker build . -t book-store/dicovery-service:latest