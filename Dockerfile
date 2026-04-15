# Use an official Maven + Java image to build the relay
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the project (creates target/relay-1.0.jar)
RUN mvn clean package

# -----------------------------
# Runtime image
# -----------------------------
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/relay-1.0.jar relay.jar

# Expose Render's port
EXPOSE 10000

# Start the relay
CMD ["java", "-cp", "relay.jar", "RelayServer"]
