#!/usr/bin/env groovy

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
        stage('Slack notification'){
            steps{
                slackSend baseUrl: 'https://hooks.slack.com/services/', 
                    botUser: true, channel: '#jenkins_pipeline',
                    color: COLOR_MAP[currentBuild.currentResult],
                    message: "*${currentBuild.currentResult}:* JOB ${env.JOB_NAME} | BUILD N° = ${env.BUILD_NUMBER}\n Plus d'infos: ${env.BUILD_URL} \n Une nouvelle image est disponible pour le projet docker\n Message du commit : ${env.GIT_COMMIT_MSG} \n Lien du commit: https://gitlab.baamtu.com/tdieng/ptn/commit/${env.GIT_COMMIT} "
            }
        }
    }
}
