pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull source code from GitHub
                git 'https://github.com/ashishgen/devops-cicd-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh 'docker build -t prt-nginx:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Stop previous container if exists
                sh 'docker rm -f prt-nginx || true'
                // Run new container
                sh 'docker run -d -p 8080:80 --name prt-nginx prt-nginx:latest'
            }
        }
    }
}
