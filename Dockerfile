FROM ubuntu:24.04 as builder
RUN apt-get -y update && apt-get -y install \
	openjdk-17-jdk \
	maven 
WORKDIR application
#copia do diretorio atual para o workdir
COPY . .  
RUN mvn clean install -DskipTests
# Define o comando de inicialização do seu projeto
ENTRYPOINT ["java", "-jar", "./target/codechella-api-1.0.jar"]