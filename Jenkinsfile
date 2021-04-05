pipeline {
   agent any
  environment {
   PATH = "/opt/maven3/bin:$PATH"
   DOCKER_TAG = getVersion()
}

  stages{
    stage('SCM build'){
      steps{
         
          git 'https://github.com/kishorpallamala39/myweb.git'
           }
    }
     stage('maven build'){
        steps{
          sh "mvn clean package"
           
        }
     }
     
     stage('docker build'){
        steps{
           sh "docker build  . -t pallamala/pallamalaapp1:${DOCKER_TAG} "
        
        }
     }
     
     stage('docker push'){
        steps{
         withCredentials([string(credentialsId: 'dockerHubPwd', variable: 'dokcerHubPwd')]) {
             sh "docker login -u pallamala -p ${dokcerHubPwd}"
        } 
           sh "docker push pallamala/pallamalaapp1:${DOCKER_TAG}"  
        
        }
     }
     
      stage('docker deploy'){
        steps{
           ansiblePlaybook credentialsId: 'Dev-server', disableHostKeyChecking: true, extras: "-e DOCKER_TAG=${DOCKER_TAG}", installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
  
        
        }
     }
  }
}



def getVersion(){
  def commitHash= sh returnStdout: true, script: 'git rev-parse --short HEAD'
   return commitHash
}
