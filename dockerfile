FROM openjdk:22-jdk-buster 

WORKDIR /app

COPY mvnw /app/mvnw
COPY .mvn /app/.mvn
COPY pom.xml /app/pom.xml
RUN ./mvnw dependency:go-offline
COPY . /app/
RUN ./mvnw install
RUN chmod +x /app/target/spring-petclinic-3.3.0-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/app/target/spring-petclinic-3.3.0-SNAPSHOT.jar"]