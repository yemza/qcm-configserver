pipeline {
    agent {
        dockerfile {
            // Optional: Specify the Dockerfile path, default is the root directory
            filename 'Dockerfile'  
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
                    // Build Docker image and tag it with the build number
                    dockerImage = docker.build("springboot-deploy:${env.BUILD_NUMBER}")
                }
            }
        }
    }
}
