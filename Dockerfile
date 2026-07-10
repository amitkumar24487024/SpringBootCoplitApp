FROM gradle:8.8-jdk17 AS builder
WORKDIR /workspace

# Copy Gradle metadata first to maximize layer caching.
COPY gradle gradle
COPY gradlew .
COPY build.gradle settings.gradle ./

# Copy source and build executable Spring Boot jar.
COPY src src
RUN gradle bootJar --no-daemon

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

ENV PORT=8080
EXPOSE 8080

COPY --from=builder /workspace/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]