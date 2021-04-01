FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/dockeransible.war





//FROM tomcat
//MAINTAINER hari@javahome.in
//RUN apt-get update
//ADD target/myweb.war /usr/local/tomcat/webapps

