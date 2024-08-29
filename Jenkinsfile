pipeline {
    agent agent { dockerfile true }
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
