pipeline{
    agent any
    environment {
       PATH = "/opt/maven3/bin:$PATH"  
        DOCKER_TAG = getVersion()
      
    }
    stages{
        stage('SCM'){
            steps{
               git 'https://github.com/kishorpallamala39/myweb.git'
            }
        }
        
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
        stage('docker build'){
            steps{
                sh "docker build . -t pallamala/pallamalaapp:${DOCKER_TAG} "
            }
        }
         stage('docker push'){
            steps{
               withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                   sh "docker login -u pallamala -p ${dockerHubPwd}"
            }
               
                sh "docker push pallamala/pallamalaapp:${DOCKER_TAG} "
            }
        }
   stage('docker deploy'){
            steps{
              ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, extras: " -e DOCKER_TAG=${DOCKER_TAG}", installation: 'Ansible2', inventory: 'dev.inv', playbook: 'deploy-docker.yml'

            }
    }
    }
   
}


def getVersion(){
def commitHash= sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash

}
