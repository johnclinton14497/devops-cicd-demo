pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/johnclinton14497/devops-cicd-demo.git'
            }
        }
        stage('Building image') {
            steps {
                script {
                    sh 'docker build -t johnclintonm/devops-oo:12 .'
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub') {
                        sh 'docker push johnclintonm/devops-oo:12'
                    }
                }
            }
        }
        stage('Deploy to K8S') {
            steps {
                script {
                    // Deployment steps to Kubernetes
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
