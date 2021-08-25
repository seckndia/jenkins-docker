
def FAILED_STAGE
pipeline {
    
   agent any
                  
    
    stages {
        stage('clone') {
            steps {
                script{
                    last_started = env.STAGE_NAME
                }
                checkout scm
            }
        }
        stage('docker version') {
            steps {
                script{
                    last_started = env.STAGE_NAME
                }
                sh 'docker --version'
            }
        }
    }

    // Post-build actions
    post{
        success{
            slackSend color: 'good', message: 'BUILD Success!'
        }
        failure{
             slackSend color: '#FF0000', message: 'Build Fail : ' + last_started
        }
    }
}
