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
        stage('Test') {
            steps {
                script {
                    sh 'docker run --rm my-spring-app mvn test'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                        sh "docker tag my-spring-app ${DOCKER_HUB_USERNAME}/my-spring-app:latest"
                        sh "echo ${DOCKER_HUB_PASSWORD} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin"
                        sh "docker push ${DOCKER_HUB_USERNAME}/my-spring-app:latest"
                    }
                }
            }
        }
    }
}