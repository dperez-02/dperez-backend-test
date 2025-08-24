pipeline {
    agent any 
    stages {
        stage('install docker node:22') {
            agent {
                docker{
                    image 'node:22'
                    reuseNode true
                }
            }
            stages{
                stage('install dependencies'){
                    steps {
                        sh 'npm install'
                    }
                }    
            }   
        }
    }
}