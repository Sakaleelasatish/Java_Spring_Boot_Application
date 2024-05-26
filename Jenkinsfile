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
