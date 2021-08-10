pipeline {
    agent { dockerfile true     } 
                  
    
    stages {
        stage('clone') {
            steps {
                checkout scm
            }
        }
        stage('docker version') {
            steps {
                sh 'docker --version'
            }
        }
    }
}
