currentBuild.displayName= "pipelin_test-#"+currentBuild.number+currentBuild.currentResult
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
           // sh "mv target/*.war target/myweb.war"
      }
     } 
    stage("tomcat-deploy"){     
      steps{
          sshagent(['Tomcat8']) {
            sh """
                  scp -o StrictHostKeyChecking=no target/myweb.war ec2-user@172.31.23.51:/opt/tomcat8/webapps/
                  ssh ec2-user@172.31.23.51  /opt/tomcat8/bin/shutdown.sh
                  ssh ec2-user@172.31.23.51  /opt/tomcat8/bin/startup.sh           
            """
          }     
      }      
    }
  }
 }
