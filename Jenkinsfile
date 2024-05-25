pipeline {
    agent any

    environment {
        // Define environment variables for Docker registry
        DOCKER_REGISTRY = "your-docker-registry"
        DOCKER_REPO = "your-docker-repo"
        DOCKER_CREDENTIALS_ID = "your-docker-credentials-id"
        APP_NAME = "jb-hello-world-maven"
        APP_VERSION = "0.1.0"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Clean and package the Maven project
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                // Run tests
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    docker.build("${DOCKER_REGISTRY}/${DOCKER_REPO}:${APP_VERSION}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to the registry
                script {
                    docker.withRegistry("https://${DOCKER_REGISTRY}", "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_REGISTRY}/${DOCKER_REPO}:${APP_VERSION}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                // Add deployment steps if needed
                echo 'Deploying application...'
            }
        }
    }

    post {
        always {
            // Clean up workspace after build
            cleanWs()
        }
        success {
            // Notify success
            echo 'Build, test, and push succeeded!'
        }
        failure {
            // Notify failure
            echo 'Build, test, or push failed.'
        }
    }
}

