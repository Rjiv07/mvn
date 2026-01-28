pipeline {
	agent any
	
	environment {
		DOCKERHUB_CRED=credentials('dockerhub')
		IMAGE_NAME="prozpek/mvn"
	}
	
	stages {
		stage('checkout') {
			steps {
				git url:'https://github.com/Rjiv07/mvn', branch:'main'
			}
		}

		stage('Build Maven Project') {
			steps {
				sh "mvn clean package -DskipTests"
			}
		}
		
		stage('Build Docker Image') {
            		steps {
                		script {
                    			dockerImage = docker.build("${IMAGE_NAME}:1.0")
                		}
            		}
        	}

		stage('Push Docker Image'){
			steps {
				script {
					docker.withRegistry('https://index.docker.io/v1/','dockerhub'){
						dockerImage.push()
					}
				}
			}
		}	
	}
}	
