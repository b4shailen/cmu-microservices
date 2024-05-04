pipeline {
    agent any
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/b4shailen/cmu-microservices.git'
                
            }
        }

        stage('SonarQube Analysis') {
            when {
                changeset "**/src/**"
            }             
            steps {
                script {
                    withSonarQubeEnv('sonar') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectKey=CMU-CAPSTONE -Dsonar.projectName=CMU-CAPSTONE -Dsonar.java.binaries=. '''
                }
            }
        }
    }
        stage('TRIVY FS SCAN') {
            steps {
                sh " trivy fs --security-checks vuln /var/lib/jenkins/workspace/CMU-CAPSTONE"
            }
        }
        
        stage('OWASP Dependency Check(adservice)') {
            steps {
                dependencyCheck additionalArguments: ' --scan **/src/adservice/build.gradle', odcInstallation: 'DC'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
             
            }
        }

        stage('adservice') {
            when {
                changeset "**/src/adservice/**"
            } 
             steps {
                 //sh 'echo "### Initiating Dependency check ####'
                dependencyCheck additionalArguments: ' --scan **/src/adservice/build.gradle', odcInstallation: 'DC'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
             
          
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker'){
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/adservice/') {
                                 sh "docker build -t cmupro7/adservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/adservice:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/adservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
            stage('Trivy Image Scan (adservice)') {
                steps {
                    //sh "trivy image --format table -o trivy-image-report.html cmupro7/adservice:${BUILD_NUMBER}"
                    sh "trivy image cmupro7/adservice:${BUILD_NUMBER} > trivy-report.txt"
                }
            }
        
        
        stage('cartservice') {
            when {
                changeset "**/src/cartservice/**"
            }            
            steps {

                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/cartservice/src/') {
                                 sh "docker build -t cmupro7/cartservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/cartservice:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/cartservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
    
        stage('currencyservice') {
            when {
                changeset "**/src/currencyservice/**"
            }            
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/currencyservice/') {
                                 sh "docker build -t cmupro7/currencyservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/currencyservice:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/currencyservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
        
		stage('emailservice') {
            when {
                changeset "**/src/emailservice/**"
            } 		    
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/emailservice/') {
                                 sh "docker build -t cmupro7/emailservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/emailservice:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/emailservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
		
		stage('frontend') {
            when {
                changeset "**/src/frontend/**"
            }		    
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/frontend/') {
                                 sh "docker build -t cmupro7/frontend:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/frontend:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/frontend:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
		
		stage('loadgenerator') {
            when {
                changeset "**/src/loadgenerator/**"
            }		    
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/loadgenerator/') {
                                 sh "docker build -t cmupro7/loadgenerator:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/loadgenerator:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/loadgenerator:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
		
		stage('paymentservice') {
            when {
                changeset "**/src/paymentservice/**"
            }		    
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/paymentservice/') {
                                 sh "docker build -t cmupro7/paymentservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/paymentservice:${BUILD_NUMBER}"
								  sh " docker rmi cmupro7/paymentservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
        
		stage('productcatalogservice') {
            when {
                changeset "**/src/productcatalogservice/**"
            }
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/productcatalogservice/') {
                                 sh "docker build -t cmupro7/productcatalogservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/productcatalogservice:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/productcatalogservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
		
		stage('recommendationservice') {
            when {
                changeset "**/src/recommendationservice/**"
            }
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/recommendationservice/') {
                                 sh "docker build -t cmupro7/recommendationservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/recommendationservice:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/recommendationservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
		
		stage('shippingservice') {
            when {
                changeset "**/src/shippingservice/**"
            }
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                          dir('/var/lib/jenkins/workspace/CMU-CAPSTONE/src/shippingservice/') {
                                 sh "docker build -t cmupro7/shippingservice:${BUILD_NUMBER} ."
                                 sh "docker push cmupro7/shippingservice:${BUILD_NUMBER}"
								 sh " docker rmi cmupro7/shippingservice:${BUILD_NUMBER}"
                        }
                    }
                }
            }
        }
    }
    post {
        success {
            echo "Build successful"
        }
        failure {
            echo "Build failed"
        }
        aborted {
            echo "Build aborted"
            }
        }
    }


