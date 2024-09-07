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
                    bat 'docker build -t qcm/configserver .'
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    bat 'docker push qcm/configserver:S1'
                }
            }
        }
    }
}
