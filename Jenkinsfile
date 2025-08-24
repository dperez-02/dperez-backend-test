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
                stage('ejecucion tests'){
                    steps{
                        sh 'npm run test:cov'
                    }
                }    
                stage('construccion aplicación'){
                    steps{
                        sh 'npm run build'
                    }
                } 
            }   
        }
        stage('etapa empaquetado y delivery'){
            steps('etapa de delivery'){
                script{
                    docker.withRegistry('http://localhost:8082/', 'nexus-credentials'){
                    sh 'docker tag backend-node-devops:cmd localhost:8082/backend-node-devops:cmd'
                    sh 'docker push localhost:8082/backend-node-devops:cmd'
                    }
                }  
            }
        }
        stage('testeo ejecucion contenedor'){
            steps{
                sh 'docker run -d --rm --env-file=.env --name backend-node-devops-container localhost:8082/backend-node-devops:cmd'
            }
        }
    }
}