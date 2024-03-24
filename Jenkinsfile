pipeline {
  environment {
    dockerimagename = "auroobaparker/jenkinsapplication"
    dockerImage = ""
  }
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'main', url: 'https://<token>@github.com/AuroobaParker1/jenkinsApplication.git'
      }
    }
    stage('Build') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }
    stage('Pushing Image') {
      environment {
          registryCredential = '8ce1ad5a-4806-4f4d-b259-b22f9df7f851'
           }
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        sh "kubectl apply -f ./k8/web-application.yaml -f ./k8/load-balancer.yaml"
      }
    }
  }
}