pipeline{
    agent any
    environment {
       PATH = "/opt/maven3/bin:$PATH"  
      
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
