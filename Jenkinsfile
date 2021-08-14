
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
//         stage('Slack notification') {
//             steps {
//                 slackSend baseUrl: 'https://hooks.slack.com/services/', 
//                     botUser: true, channel: '#jenkins_pipeline', color: 'good',
//                     message: 'Welcome to jenkins slack', notifyCommitters: true,
//                     tokenCredentialId: 'slack-demo', 
//                     username: 'kadidiatou.ndiaye'
//             }
//         }
       stage('Error') {
          // when doError is equal to 1, return an error
          when {
            expression { doError == '1' }
          }
          steps {
            echo "Failure :("
            error "Test failed on purpose, doError == str(1)"
          }
        }
       stage('Success') {
          // when doError is equal to 0, just print a simple message
          when {
            expression { doError == '0' }
          }
          steps {
            echo "Success :)"
          }
        }

      }
    // Post-build actions
  post {
    success {
     slackSend baseUrl: 'https://hooks.slack.com/services/',
         botUser: true, channel: '#jenkins_pipeline', 
         color: 'COLOR_MAP[currentBuild.currentResult]', 
         message: '*${currentBuild.currentResult}:* JOB ${env.JOB_NAME} | BUILD N° = ${env.BUILD_NUMBER}\\n Plus d\'infos: ${env.BUILD_URL} \\n Une nouvelle image est disponible pour le projet',
         notifyCommitters: true,
         tokenCredentialId: 'slack-demo',
         username: 'kadidiatou.ndiaye'
    }
    failure {
     slackSend baseUrl: 'https://hooks.slack.com/services/',
         botUser: true, channel: '#jenkins_pipeline',
         color: 'COLOR_MAP[currentBuild.currentResult]',
         message: '*${currentBuild.currentResult}:* JOB ${env.JOB_NAME} | BUILD N° = ${env.BUILD_NUMBER}\\n Plus d\'infos: ${env.BUILD_URL} \\n Une nouvelle image est disponible pour le projet',
         notifyCommitters: true, 
         tokenCredentialId: 'slack-demo',
         username: 'kadidiatou.ndiaye'
    }
  }
}
  
    

