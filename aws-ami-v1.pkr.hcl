# If you have your default VPC available then use it. 

# packer puglin for AWS 
# https://www.packer.io/plugins/builders/amazon 
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# which ami to use as the base and where to save it
source "amazon-ebs" "amazon-linux-a" {
  access_key      = ""
  secret_key      = ""
  region          = "ap-south-1"
  ami_name        = "ami-version-1.0.1-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-006935d9a6773e4ec"
  ssh_username    = "ec2-user"
  #ami_users       = ["AWS Account ID"]
  ami_regions     = [
                      "ap-south-1"
                    ]
}

# what to install, configure and file to copy/execute
build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.amazon-linux-a"
  ]

  provisioner "file" {
  source = "provisioner.sh"
  destination = "/tmp/provisioner.sh"
}

provisioner "shell" {
    inline = [ "ls -la /tmp"]
  }

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }
  
  provisioner "shell" {
    inline = [ "ls -la /tmp"]
  }
  
    provisioner "shell" {
    inline = [ "pwd"]
  }
  
  provisioner "shell" {
    inline = [ "cat /tmp/provisioner.sh"]
  }

  provisioner "shell" {
    inline = ["/bin/bash -x /tmp/provisioner.sh"]
  }
}
