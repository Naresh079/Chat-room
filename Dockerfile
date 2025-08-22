FROM maven:3.8.6-jdk-17-slim AS build

WORKDIR /app

# Copy Maven config and source code
COPY pom.xml .
COPY src ./src

# Build the project and skip tests (optional)
RUN mvn clean package -DskipTests

# Stage 2: Run the app using a minimal OpenJDK image
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/chat-room-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on (default 8080)
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
