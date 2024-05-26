# Java Spring Boot Application

This is a simple Java Spring Boot application that serves a "Hello World" message along with the current local time. It also includes a web interface styled with CSS and displays an image.

## Project Structure

```plaintext
.
├── Dockerfile
├── pom.xml
├── src
│   └── main
│       ├── java
│       │   └── hello
│       │       ├── Greeter.java
│       │       ├── HelloWorldApplication.java
│       │       ├── HelloWorldController.java
│       │       └── HelloWorld.java
│       └── resources
│           ├── application.properties
│           └── static
│               ├── images
│               │   └── hello-world.jpg
│               ├── index.html
│               └── styles.css
└── target
    ├── classes
    │   ├── application.properties
    │   ├── hello
    │   │   ├── Greeter.class
    │   │   ├── HelloWorldApplication.class
    │   │   ├── HelloWorld.class
    │   │   └── HelloWorldController.class
    │   └── static
    │       ├── images
    │       │   └── hello-world.jpg
    │       ├── index.html
    │       └── styles.css
    ├── generated-sources
    │   └── annotations
    ├── jb-hello-world-maven-0.1.0.jar
    ├── jb-hello-world-maven-0.1.0.jar.original
    ├── maven-archiver
    │   └── pom.properties
    └── maven-status
        └── maven-compiler-plugin
            └── compile
                └── default-compile
                    ├── createdFiles.lst
                    └── inputFiles.lst

Prerequisites
Java 11
Maven
Docker

Building the Project

To build the project, navigate to the project root directory and run the following command:mvn clean package
This will compile the source code, run tests, and package the application into a JAR file located in the target directory.

Running the Application
To run the application using the JAR file:java -jar target/jb-hello-world-maven-0.1.0.jar

The application will start and be accessible at http://localhost:9090.

Docker Setup
Dockerfile
The Dockerfile for this project is as follows:
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

Building the Docker Image
To build the Docker image, run the following command from the project root directory:
docker build -t hello-world-app .

Running the Docker Container
To run the Docker container, use the following command:
docker run -itd --name hello-world-container1 -p 9090:9090 hello-world-app


The application will be accessible at http://localhost:9090

Application Endpoints
/time: Returns the current local time.
/greeting: Returns a greeting message.


CSS Styling
The styles.css file contains the styles for the web interface:

/* Reset some default browser styles */
body, h1, p {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

/* Basic styles for the body */
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: url('/images/background.jpg') no-repeat center center fixed;
    background-size: cover;
    color: #333;
}

/* Styles for the main container */
.container {
    text-align: center;
    background: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Styles for the heading */
h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
    color: #007BFF;
}

/* Styles for the time and greeting paragraphs */
p {
    font-size: 1.2em;
    margin-bottom: 10px;
}

/* Style for the script output paragraphs */
#time, #greeting {
    margin-top: 10px;
    font-weight: bold;
}

/* Additional styles for better readability */
.container p {
    margin-bottom: 1em;
    line-height: 1.6;
}

/* Styling for images */
img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

/* Style for footer */
footer {
    margin-top: 20px;
    font-size: 0.9em;
    color: #666;
}



License
This project is licensed under the MIT License - see the LICENSE file for details.


This `README.md` file provides a complete overview of your project, including the structure, build instructions, Docker setup, and other relevant information. Adjust any details as necessary to fit your specific project requirements.

