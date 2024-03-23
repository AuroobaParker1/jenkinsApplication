pipeline {
  environment {
    dockerimagename = "jenkins-kubernetes-deployment"
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
          registryCredential = 'dockerhub-credentials'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        script {
          kubernetesDeploy(configs: "k8/web-application.yaml", 
                                         "k8/load-balancer.yaml")
        }
      }
    }
  }
}