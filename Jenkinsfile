
def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]


pipeline {
    environment {
        // test variable: 0=success, 1=fail; must be string
        doError = '0'
        GIT_COMMIT_MSG = sh(returnStdout: true, script: "git log -1 --pretty=%B").trim()
    }
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
        stage('Slack notification') {
            steps {
                slackSend baseUrl: 'https://hooks.slack.com/services/', 
                    botUser: true, channel: '#jenkins_pipeline', color: 'good',
                    message: 'Welcome to jenkins slack', notifyCommitters: true,
                    tokenCredentialId: 'slack-demo', 
                    username: 'kadidiatou.ndiaye'
            }
        }
       
    }
}
