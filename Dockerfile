FROM eclipse-temurin:21-jre

WORKDIR /app

COPY target/generator-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
