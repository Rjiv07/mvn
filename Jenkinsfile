pipeline {
	agent any

	triggers{
		cron('* * * * *')
	}
	
	environment {
		DOCKERHUB_CRED=credentials('dockerhub')
		IMAGE_NAME="rohit2686/maven"
	}
	
	stages {
		stage('checkout') {
			steps {
				git url:'https://github.com/1ms24mc087/maven', branch:'master'
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
