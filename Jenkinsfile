pipeline {
   agent any
  environment {
   PATH = "/opt/maven3/bin:$PATH"
}

  stages{
    stage('SCM build'){
      steps{
         
          git 'https://github.com/kishorpallamala39/myweb.git'
           }
    }
     stage('maven build'){
        steps{
          sh 'mvn clean package'
           
        }
     }
     
     stage('docker build'){
        steps{
           sh 'docker build . -t pallamala:pallamalaapp1:21.3.2.1 '
        
        }
     }
  }
}
