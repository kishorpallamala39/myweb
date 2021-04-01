pipeline{
    agent any
    tools {
      maven 'maven3'
    }
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
    }
}
