# Stage 1: Build the application
FROM maven:3.8.6-openjdk-18-slim AS build
WORKDIR /spc
COPY . /spc
RUN mvn package

# Stage 2: Create a lightweight image for running the application
FROM maven:3.8.6-openjdk-18-slim

# Create a non-root user and group with specific UID and GID
RUN addgroup --gid 1000 spc && adduser --home "/spc" --uid 1006 --ingroup spc --shell /bin/bash --disabled-password --gecos "" spc

# Set the working directory for the application
WORKDIR /spc

# Copy the JAR file from the build stage
COPY --from=build /spc/target/spring-petclinic-3.1.0-SNAPSHOT.jar ./spring-petclinic-3.1.0-SNAPSHOT.jar

# Switch to the non-root user
USER spc

# Expose the port the application will run on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]
