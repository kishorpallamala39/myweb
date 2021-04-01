pipeline{
    agent any
    tools {
      maven 'maven3'
    }
    environment {
      DOCKER_TAG = getVersion()
    }
    stages{
        stage('SCM'){
            steps{
                git credentialsId: 'github', 
                    url: 'https://github.com/kishorpallamala39/dockeransiblejenkins'
            }
        }
        
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
    }
}
