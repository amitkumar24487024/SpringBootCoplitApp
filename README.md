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

### GET /health

Returns:

```text
UP
```

### GET /hello

Returns:

```text
Hello
```

## Configuration

Application name:

```properties
spring.application.name=SpringBootCoplitApp
server.port=${PORT:8080}
```

## Docker

Build image locally:

```powershell
docker build -t springbootcoplitapp:local .
```

Run image locally:

```powershell
docker run --rm -p 8080:8080 -e PORT=8080 springbootcoplitapp:local
```

## Deploy To Google Cloud Run

Set variables:

```powershell
$PROJECT_ID="your-gcp-project-id"
$REGION="us-central1"
$REPO="springbootcoplitapp"
$SERVICE="springbootcoplitapp"
$IMAGE="$REGION-docker.pkg.dev/$PROJECT_ID/$REPO/$SERVICE:latest"
```

Enable APIs:

```powershell
gcloud services enable run.googleapis.com artifactregistry.googleapis.com cloudbuild.googleapis.com
```

Create Artifact Registry repository (first time only):

```powershell
gcloud artifacts repositories create $REPO --repository-format=docker --location=$REGION
```

Build and push image:

```powershell
gcloud builds submit --tag $IMAGE
```

Deploy service (public access with recommended defaults):

```powershell
gcloud run deploy $SERVICE \
	--image $IMAGE \
	--platform managed \
	--region $REGION \
	--allow-unauthenticated \
	--port 8080 \
	--cpu 1 \
	--memory 512Mi \
	--concurrency 80 \
	--timeout 300 \
	--min-instances 0 \
	--max-instances 3
```

Verify deployment:

```powershell
gcloud run services describe $SERVICE --region $REGION --format='value(status.url)'
```

Use the returned URL with `/health`, `/hello`, and `/greet`.
