pipeline {
    agent {
        docker {
            image 'node:14-alpine' 
         }
    }
    stages {
        stage('clone') {
            steps {
                checkout scm
            }
        }
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}