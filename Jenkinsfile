pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'myDockerHubCer' // Set your credentials ID here
    }
    stages {
        stage('Checkout SCM') {
            steps {
                deleteDir()
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Docker Image') {
            steps {
                script {
                    bat 'docker build -t qcm/configserver:S1 .'
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS_ID) {
                    bat 'docker push qcm/configserver:S1'
                    }
                }
                
            }
        }
    }
}
