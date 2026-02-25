pipeline {
    agent any

    environment {
        CONTAINER_NAME = 'java-container'
        DOCKER_IMAGE = 'java-app'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository from GitHub...'
                git branch: 'main', url: 'https://github.com/YOUR_USERNAME/java-quotes-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Stop Old Container') {
            steps {
                echo 'Stopping old container (if exists)...'
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                echo 'Running new container...'
                sh 'docker run -d -p 8000:8000 --name $CONTAINER_NAME $DOCKER_IMAGE'
            }
        }

        stage('Show Running Containers') {
            steps {
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful 🚀'
        }
        failure {
            echo 'Pipeline failed ❌ Check console logs.'
        }
    }
}