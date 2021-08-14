pipeline {
    agent any
                  
    
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
        stage('Slack notification'){
            steps{
                slackSend baseUrl: 'https://hooks.slack.com/services/', 
                    botUser: true, channel: '#jenkins_pipeline', color: 'good',
                    message: 'Welcome to slack', notifyCommitters: true,
                    tokenCredentialId: 'slack-demo', 
                    username: 'kadidiatou.ndiaye'
            }
        }
    }
}
