# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged jar file into the container
COPY target/jb-hello-world-maven-0.1.0.jar /app/jb-hello-world-maven-0.1.0.jar

# Make port 9090 available to the world outside this container
EXPOSE 9090

# Run the jar file
