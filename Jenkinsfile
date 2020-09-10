#!groovy
properties([disableConcurrentBuilds()])

pipeline {
    environment { 
        registry = "avvppro/dt-nginx" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 
    }
    agent any
    stages {
        stage("Build Docker Image") {
            steps {
                script { 
                    dockerImage = docker.build registry
                }
            }
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push("${env.GIT_COMMIT}") 
                        dockerImage.push("latest") 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:${env.GIT_COMMIT}"
                sh "docker rmi $registry:latest"
            }
        } 
    }

}