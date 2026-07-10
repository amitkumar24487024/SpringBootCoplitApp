# SpringBootCoplitApp

SpringBootCoplitApp is a simple Spring Boot REST API built with Gradle.

## Overview

- Java 17
- Spring Boot 3.2.5
- Gradle build
- Single REST endpoint for a basic health-style response

## Features

- `GET /hello` returns `Hello`
- Spring Boot application entry point
- MockMvc-based integration test for the endpoint

## Project Structure

- `src/main/java/com/example/demo/DemoApplication.java` - application bootstrap
- `src/main/java/com/example/demo/HelloController.java` - REST controller
- `src/main/resources/application.properties` - application configuration
- `src/test/java/com/example/demo/DemoApplicationTests.java` - test coverage

## Prerequisites

- JDK 17
- Gradle Wrapper (included)

## Run

```bash
./gradlew bootRun
```

On Windows:

```powershell
.\gradlew.bat bootRun
```

## Test

```bash
./gradlew test
```

On Windows:

```powershell
.\gradlew.bat test
```

## API

### GET /hello

Returns:

```text
Hello
```

## Configuration

Application name:

```properties
spring.application.name=SpringBootCoplitApp
```
