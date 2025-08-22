# Use official OpenJDK 17 slim image
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy your jar file into the container
COPY target/chat-room-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 (default Spring Boot port)
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
