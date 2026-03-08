pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Pulling source code from Git...'
                git branch: 'master', url: 'https://github.com/ashishgen/devops-cicd-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t devops-cicd-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                // Remove old container if exists
                sh '''
                if [ $(docker ps -aq -f name=devops-cicd-app) ]; then
                    docker rm -f devops-cicd-app
                fi

                # Choose a random free port between 8000-8999
                PORT=$(shuf -i 8000-8999 -n 1)
                echo "Using port $PORT"

                # Run container
                docker run -d -p $PORT:80 --name devops-cicd-app devops-cicd-app

                echo "Container running on port $PORT"
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Deployment verified manually via browser or curl'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
