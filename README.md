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


<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>org.springframework</groupId>
    <artifactId>JSB-PROJECT</artifactId>
    <version>1.0.0-SNAPSHOT</version>
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
        <sonar.host.url>http://100.25.220.128:9000</sonar.host.url>
        <sonar.login>437ce097a020ff2be03797cfca6f399b2a883409</sonar.login>
        <spring-boot.version>2.7.12</spring-boot.version>
    </properties>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>${spring-boot.version}</version>
                <configuration>
                    <mainClass>hello.HelloWorldApplication</mainClass> <!-- Specify your main class here -->
                    <layout>JAR</layout>
                </configuration>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <version>${spring-boot.version}</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <version>${spring-boot.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>joda-time</groupId>
            <artifactId>joda-time</artifactId>
            <version>2.10.10</version>
        </dependency>
        <!-- Add other dependencies as needed -->
    </dependencies>

</project>



Prerequisites
Java 11
Maven
Docker
Jenkins
Goto AWS account and launch instance with t2.medium and AMi is amazon linux

sudo su -
yum install -y git  maven docker

git --version
maven --version
docker --version

Enable and start the service :docker

systemctl enable docker
systemctl start docker
systemctl status docker

connection to git hub to server
============================================================
git config --global user.emailid sakaleelasatish@gmail.com
git config --global user.name sakaleelasatish
git config --global credential.helper store


ls -la

cat .gitconfig

[user]
        emailid = yourgithubmail@gmail.com
        name = githubusername
[credential]
        helper = store


for token 
===============
==>go to github account
--->settings
--->developer settings
--->personal access tokens
--->Token(classic)-->
Generate new token
--> Generate new token classic
-->NOTE[give note here]
-->select scopes
--> Generete Token
==>copy token in notepad

go to instance in Mobaxterm

yum install -y nano

nano ~/.git-credentials          #Create .git-credentils

ctrl+x to exit the nano 
press y
press enter

https://<YOUR_GITHUB_USERNAME>:<YOUR_PAT>@github.com

Clone your Project repo
git clone https://github.com/Sakaleelasatish/Java_Spring_Boot_Application.git
ls
Java_Spring_Boot_Application

cd Java_Spring_Boot_Application

ls

Dockerfile  Jenkinsfile  pom.xml  README.md  src target

do some modifications

git add .
git commit -m "commit msg"
git push origin main
webhook configuration to your project
go to github account
--> go to project repo
--> on top select settings
-->click webhooks(on leftside) 
-->Add webhook
-->payload url* http://local-host:8080/github-webhook/ 
--> content type select application/json   
--> Which events would you like to trigger this webhook? --? select Send me everything
--> ADD WEBHOOK




-jenkins installation --

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key


---java installation---

  yum install fontconfig java-11*
  yum install jenkins

Enable and start the service :

systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins


edit inbound rules in the jenkins server add 8080(default port number for jenkins)
http://ipaddress:8080
then you successfully run the jenkins server

once open the jenkins server
copy /var/lib/jenkins/secrets/initialAdminPassword

 then you can paste in the mobaxterm by using cat command
cat /var/lib/jenkins/secrets/initialAdminPassword 
then you get the password copy and paste it in the jenkins server
and select suggested  plugins
Create user account  
Name : admin
Password : admin
Confirm Password : admin
Full Name:
Email id :

then dashboard of jenkins will open

To create a job in jenkins
go to jenkins
--> go to dashboard-->select new item--> Enter an item name: #my-java-project  --> select pipeline --> click OK 
-->general--> Description--> Gitthub project : https://github.com/Sakaleelasatish/Java_Spring_Boot_Application.git
--> Build triggers-->select GitHub hook trigger for GITScm polling
-->Pipeline
   Definition
   select pipeline script from scm
    --> SCM : GIT
    --> Repository url  https://github.com/Sakaleelasatish/Java_Spring_Boot_Application.git
    --> Branch */main
    save
Build the project by clicking the button Buildnow

edit inbound rules in the jenkins server add 9090(To access our application)

http://publicipaddress:9090

then you successfully run the Java_Spring_Boot_Application


[Manually]
{---
Building the Project
To build the project, navigate to the project root directory and run the following command:

mvn clean package


This will compile the source code, run tests, and package the application into a JAR file located in the target directory.



Running the Application
To run the application using the JAR file:


java -jar target/jb-hello-world-maven-0.1.0.jar    ---}

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
