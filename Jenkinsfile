pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                deleteDir()
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Docker Image') {
            steps {
                script {
                    // Check if Docker is installed
                    def dockerInstalled = sh(script: 'which docker || true', returnStatus: true) == 0
                    if (!dockerInstalled) {
                        error 'Docker is not installed or not in the PATH'
                    }
                    
                    // Build Docker image
                    sh "docker build -t qcm/configserver ."
                }
            }
        }
    }
}
