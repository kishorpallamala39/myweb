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
                sh "docker build -t pallamala/pallamalaApp:${DOCKER_TAG} ."
            }
        }
    }
}

def getVersion(){
def commitHash= sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash

}
