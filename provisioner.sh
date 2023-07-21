#!/bin/bash

# update package
sudo yum -y update

# install git
sudo yum install git -y
sudo git --version

#Download jenkins pkg
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
#install java
sudo amazon-linux-extras install java-openjdk11 -y
#install jenkins
sudo yum install jenkins -y
#jenkins service auto start
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

#install nginx
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx  
#start nginx auto
sudo systemctl enable nginx
sudo systemctl restart nginx
sudo systemctl status nginx



# install docker
sudo yum -y install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
# docker service auto start
sudo systemctl enable docker.service
sudo systemctl start docker.service

# install SSM
sudo yum install https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
#sudo systemctl start amazon-ssm-agent

# install cloudwatch agent
sudo yum install https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status

# install AWS inspector
curl -O https://inspector-agent.amazonaws.com/linux/latest/install
sudo bash install

sudo yum update -y

