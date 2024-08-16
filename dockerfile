FROM openjdk:22-jdk-buster 

WORKDIR /app

COPY mvnw /app/mvnw
COPY .mvn /app/.mvn
COPY pom.xml /app/pom.xml
COPY settings.xml /app/settings.xml
RUN ./mvnw dependency:go-offline
RUN ./mvnw dependency:tree
COPY . /app/
RUN ./mvnw clean
RUN ./mvnw install
RUN chmod +x /app/target/spring-petclinic-3.3.0-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/app/target/spring-petclinic-3.3.0-SNAPSHOT.jar"]