FROM tomcat:8.5.61-jdk8-openjdk

ENV IR4_HOME /usr/local/mariner4

RUN apt-get update -y 
RUN apt-get install vim -y

WORKDIR /usr/local/mariner4
COPY ./files/server.xml /usr/local/tomcat/conf/

EXPOSE 5555
EXPOSE 8080

ENTRYPOINT ["catalina.sh", "run"]