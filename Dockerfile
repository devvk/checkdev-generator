# Этап 1: сборка проекта + тесты
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .
COPY checkstyle.xml .
COPY src ./src

RUN mvn verify

# Этап 2: указание как запустить контейнер
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/target/generator-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
