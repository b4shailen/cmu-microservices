// This file has been written and tested by Shailendra Singh for CMU project 

pipeline {
    agent any
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                //git branch: 'latest', url: 'https://github.com/devopsprepa/CMU-Project7.git'
                git branch: 'latest', url: 'https://github.com/b4shailen/cmu-microservices.git'
                
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                
                withSonarQubeEnv('sonar') {
                 sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectKey=CMU-CAPSTONE -Dsonar.projectName=CMU-CAPSTONE -Dsonar.java.binaries=. '''
                }

            }
        }

        stage('adservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker'){
                    //withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/adservice/') {
                                 sh "docker build -t cmupro7/adservice:latest ."
                                 sh "docker push cmupro7/adservice:latest"
								 sh " docker rmi cmupro7/adservice:latest"
                        }
                    }
                }
            }
        }
        stage('cartservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/cartservice/src/') {
                                 sh "docker build -t cmupro7/cartservice:latest ."
                                 sh "docker push cmupro7/cartservice:latest"
								 sh " docker rmi cmupro7/cartservice:latest"
                        }
                    }
                }
            }
        }
        stage('currencyservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/currencyservice/') {
                                 sh "docker build -t cmupro7/currencyservice:latest ."
                                 sh "docker push cmupro7/currencyservice:latest"
								 sh " docker rmi cmupro7/currencyservice:latest"
                        }
                    }
                }
            }
        }
        
		stage('emailservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/emailservice/') {
                                 sh "docker build -t cmupro7/emailservice:latest ."
                                 sh "docker push cmupro7/emailservice:latest"
								 sh " docker rmi cmupro7/emailservice:latest"
                        }
                    }
                }
            }
        }
		
		stage('frontend') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/frontend/') {
                                 sh "docker build -t cmupro7/frontend:latest ."
                                 sh "docker push cmupro7/frontend:latest"
								 sh " docker rmi cmupro7/frontend:latest"
                        }
                    }
                }
            }
        }
		
		stage('loadgenerator') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/loadgenerator/') {
                                 sh "docker build -t cmupro7/loadgenerator:latest ."
                                 sh "docker push cmupro7/loadgenerator:latest"
								 sh " docker rmi cmupro7/loadgenerator:latest"
                        }
                    }
                }
            }
        }
		
		stage('paymentservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/paymentservice/') {
                                 sh "docker build -t cmupro7/paymentservice:latest ."
                                 sh "docker push cmupro7/paymentservice:latest"
								  sh " docker rmi cmupro7/paymentservice:latest"
                        }
                    }
                }
            }
        }
        
		stage('productcatalogservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/productcatalogservice/') {
                                 sh "docker build -t cmupro7/productcatalogservice:latest ."
                                 sh "docker push cmupro7/productcatalogservice:latest"
								 sh " docker rmi cmupro7/productcatalogservice:latest"
                        }
                    }
                }
            }
        }
		
		stage('recommendationservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/recommendationservice/') {
                                 sh "docker build -t cmupro7/recommendationservice:latest ."
                                 sh "docker push cmupro7/recommendationservice:latest"
								 sh " docker rmi cmupro7/recommendationservice:latest"
                        }
                    }
                }
            }
        }
		
		stage('shippingservice') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/shippingservice/') {
                                 sh "docker build -t cmupro7/shippingservice:latest ."
                                 sh "docker push cmupro7/shippingservice:latest"
								 sh " docker rmi cmupro7/shippingservice:latest"
                        }
                    }
                }
            }
        }
    }
}
