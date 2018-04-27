FROM ubuntu

RUN apt-get update -y 
RUN apt-get install -y openjdk-8-jdk
RUN git clone -b master --single-branch https://github.com/ganeshtidke0901/petclinic.git
WORKDIR /  
RUN mvn build

ADD ./target/*.war $CATALINA_HOME/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]