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
                    dockerImage = docker.build("springboot-deploy:${env.BUILD_NUMBER}")
                    sh 'docker build -t qcm/configserver .'
                }
            }
        }
    }
}
