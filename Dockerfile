#FROM openjdk:17-jdk-slim
#EXPOSE 8888
#ADD target/configserver-0.0.1-SNAPSHOT.jar configserver-0.0.1-SNAPSHOT.jar
#ENTRYPOINT [ "java" ,"-jar" , "configserver-0.0.1-SNAPSHOT.jar" ]

#docker build . -t book-store/dicovery-service:latest
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-jdk-slim

EXPOSE 8888

COPY --from=build /build/libs/configserver-0.0.1-SNAPSHOT.jar configserver-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "configserver-0.0.1-SNAPSHOT.jar"]
