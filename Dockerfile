# Start with a lightweight Java runtime
FROM openjdk:17-jdk-slim

# Copy the built JAR file into the image
COPY target/*.jar app.jar

# Expose the default port
EXPOSE 8080

# Set the entrypoint
ENTRYPOINT ["java", "-jar", "/app.jar"]
