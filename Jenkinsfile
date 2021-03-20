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
            sh "mv target/*.war target/myweb.war"
      }
     } 
    stage(tomcat-deploy){
      
          sshagent(['Tomcat8']) {
            sh """
                  scp -o StrictHostKeyChecking=no target/myweb.war ec2-user@172.31.23.51:/opt/tomcat8/webapps/
                  ssh c2-user@172.31.23.51  /opt/tomcat8/bin/shutdown.sh
                  ssh c2-user@172.31.23.51  /opt/tomcat8/bin/startup.sh
            
            
            """
          }     
             
      
    
    }
  }
 }
