pipeline {
  environment {
    registry = "johnclintonm/devops-oo"
    registryCredential = 'docker-hub-credentials'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git ''
      }
    }
    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build("${registry}:${env.BUILD_NUMBER}")
        }
      }
    }
    stage('Push Image') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push("${env.BUILD_NUMBER}")
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploy to K8S') {
      steps {
        sh 'kubectl apply -f deployment.yml'
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}

