# FROM alpine/git
# WORKDIR /app
# RUN git clone https://github.com/Nikhil713/Jenkins_Spring.git 

# FROM maven:3.5-jdk-8-alpine
# WORKDIR /app
# COPY --from=0 /app/Jenkins_Spring /app 
# RUN mvn install 

# FROM openjdk:8-jre-alpine
# WORKDIR /app
# COPY --from=1 /app/target/Jenkins_Spring-1.5.1.jar /app 
# CMD ["java -jar Jenkins_Spring-1.5.1.jar"]

FROM maven:3.5.4-jdk-8-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:8u171-jre-alpine
WORKDIR /adevguide
COPY --from=maven target/SimpleJavaProject-*.jar ./SimpleJavaProject.jar
CMD ["java", "-jar", "./SimpleJavaProject.jar"]