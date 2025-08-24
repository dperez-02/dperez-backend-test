pipeline {
    agent any 

    stages {
        stage('install') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t my-spring-app .'
                }
            }
        }
    }
}