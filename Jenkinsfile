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
          registryCredential = '8ce1ad5a-4806-4f4d-b259-b22f9df7f851'
           }
      steps{
        script {
          withCredentials([usernamePassword(credentialsId: '8ce1ad5a-4806-4f4d-b259-b22f9df7f851', passwordVariable: 'admin@123', usernameVariable: 'auroobaparker')]){
            docker tag dockerimagename 'auroobaparker/jenkins-kubernetes-deployment'
            docker push 'auroobaparker/jenkins-kubernetes-deployment'
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