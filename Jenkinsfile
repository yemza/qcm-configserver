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
        stage('docker image') {
            steps {
                sh 'mvn compile jib:dockerBuild'
            }
        }

    }
}
