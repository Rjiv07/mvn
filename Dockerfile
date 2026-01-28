FROM eclipse-temurin:17-jdk-alpine

WORKDIR /demo
	
COPY target/*.jar app.jar
	
EXPOSE 7000
	
CMD ["java","-jar","app.jar"]
