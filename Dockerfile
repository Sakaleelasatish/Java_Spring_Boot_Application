# Use the official OpenJDK image from the Docker Hub
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/jb-hello-world-maven-0.1.0.jar /app/jb-hello-world-maven-0.1.0.jar

# Expose the port the application runs on
EXPOSE 9090

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/jb-hello-world-maven-0.1.0.jar"]
