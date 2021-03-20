pipeline{
  agent any
  stages{
    stage("SCM-Chekout"){
      steps{
      git 'https://github.com/kishorpallamala39/myweb.git'
      }
       }
    
    stage("Maven_build"){
      steps{
            tool name: 'Maven3', type: 'maven'
      
      }
    
    } 
  
  }
 }
