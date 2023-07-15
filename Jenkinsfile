pipeline {
    agent any
    stages {
        stage("packer version"){
            steps{
                sh "packer --version"
            }
        }
        stage("clone repo") {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/charlessinhh/packer.git'
                echo "github repository cloned"  
                
            }
        }
        stage("packer build"){
            steps{
                withCredentials([
                    [
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws_credential',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]
                ]){
                    echo "packer build "
                    // sh "pwd"
                    sh "packer init ."
                    sh "packer build ."
                    echo "ami created "
                }
            }
        }
        
    }
}
