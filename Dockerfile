FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/Nikhil713/Jenkins_Spring.git 

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/Jenkins_Spring /app 
RUN mvn install 

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/Jenkins_Spring-1.5.1.jar /app 
CMD ["java -jar Jenkins_Spring-1.5.1.jar"]
