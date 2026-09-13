pipeline {
    agent { label 'ci-agent' }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')  // Jenkins credential ID (username+password)
        IMAGE_NAME = "yourdockerhubusername/cicd-demo-app"      // <-- change to your Docker Hub username
        IMAGE_TAG  = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/ChetanaMali/cicd-k8s-assignment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker push ${IMAGE_NAME}:latest"
            }
        }

        stage('Done') {
            steps {
                echo "PRT – CI/CD Completed Successfully"
            }
        }
    }

    post {
        success {
            echo "Build ${IMAGE_TAG} pushed successfully as ${IMAGE_NAME}:latest"
        }
        failure {
            echo "Pipeline failed — check console log above."
        }
    }
}
