pipeline {
    agent {
        docker { 
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock' // To allow Docker commands to access Docker daemon
        }
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
                    sh 'docker build -t qcm/configserver .'
                }
            }
        }
    }
}
