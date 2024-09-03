#FROM openjdk:17-jdk-slim
#EXPOSE 8888
#ADD target/configserver-0.0.1-SNAPSHOT.jar configserver-0.0.1-SNAPSHOT.jar
#ENTRYPOINT [ "java" ,"-jar" , "configserver-0.0.1-SNAPSHOT.jar" ]

#docker build . -t book-store/dicovery-service:latest



FROM maven:3.8.5-openjdk-17 AS build
COPY ..
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build target/configserver-0.0.1-SNAPSHOT.jar configserver-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java" ,"-jar" , "configserver-0.0.1-SNAPSHOT.jar" ]
