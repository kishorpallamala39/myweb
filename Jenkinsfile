pipeline{
  agent any
  
  environment {
  PATH = "/opt/maven3/bin:$PATH"
}

  stages{
    stage("SCM-Chekout"){
      steps{
      git 'https://github.com/kishorpallamala39/myweb.git'
      }
       }
    
    stage("Maven_build"){
      steps{
           // tool name: 'Maven3', type: 'maven'
            sh "mvn clean package"
      
      }
    
    } 
  
  }
 }
