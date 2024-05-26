# Java Spring Boot Application

This is a simple Java Spring Boot application that serves a "Hello World" message. It also includes a web interface styled with CSS and displays an image.

## Project Structure

```plaintext
.
├── Dockerfile
├── Jenkinsfile
├── pom.xml
├── README.md
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
Jenkins


Building the Project
To build the project, navigate to the project root directory and run the following command:

mvn clean package


This will compile the source code, run tests, and package the application into a JAR file located in the target directory.



Running the Application
To run the application using the JAR file:


java -jar target/jb-hello-world-maven-0.1.0.jar




The application will start and be accessible at http://localhost:9090



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

docker run -itd --name hello-world-container -p 9090:9090 hello-world-app



The application will be accessible at http://localhost:9090


Jenkins Pipeline
Jenkinsfile
The Jenkinsfile for this project is as follows:
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Sakaleelasatish/Java_Spring_Boot_Application.git']])
            }
        }

        stage('Build') {
            steps {
                // Clean and package the Maven project
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile
                script {
                    sh 'docker build -t hello-world-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container from the built image
                script {
                    sh 'docker run -itd --name hello-world-container -p 9090:9090 hello-world-app'
                }
            }
        }
    }
}


Adding Jenkins User to Docker Group
To allow Jenkins to run Docker commands, you need to add the Jenkins user to the Docker group:

Add Jenkins User to Docker Group:

sudo usermod -aG docker jenkins


Restart Jenkins to apply the changes:

sudo systemctl restart jenkins


Verify Jenkins User is in Docker Group:

groups jenkins


Ensure that docker is listed in the groups.

Application Endpoints
/greeting: Returns a greeting message.


License
This project is licensed under the MIT License - see the LICENSE file for details.


This `README.md` file includes instructions for setting up Jenkins with Docker, along with the Jenkins pipeline configuration and other project details.
