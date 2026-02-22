pipeline {
    agent { label 'java agent' }

    environment {
        APP_NAME = 'java-quotes-app'
        CONTAINER_NAME = 'java-container'
        DOCKER_IMAGE = 'java-app'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning repo from GitHub..."
                git branch: 'master', url: 'https://github.com/YOUR_USERNAME/java-quotes-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Stop Old Container') {
            steps {
                echo "Stopping old container if running..."
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                echo "Running container..."
                sh 'docker run -d -p 8080:8080 --name $CONTAINER_NAME $DOCKER_IMAGE'
            }
        }

        stage('Post Build Info') {
            steps {
                echo "Deployment complete. Application should be running on port 8080 of the agent."
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo "Pipeline finished successfully!"
        }
        failure {
            echo "Pipeline failed. Check console logs."
        }
    }
}
