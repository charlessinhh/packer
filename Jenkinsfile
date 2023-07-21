pipeline {
    agent any
    stages {
        stage("packer version"){
            steps{
                sh "packer --version"
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
                    sh "pwd"
                    sh "packer init aws-ami-jenkins.pkr.hcl"
                    sh "packer build aws-ami-jenkins.pkr.hcl"
                    echo "ami created "
                }
            }
        }
        
    }
}
