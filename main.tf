terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"    
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "bia-dev" {
    ami = "ami-060a84cbcb5c14844"
    instance_type = "t3.micro"
    iam_instance_profile = aws_iam_instance_profile.role_acesso_ssm.name
    user_data = <<EOF
#!/bin/bash

#Instalar Docker e Git
sudo yum update -y
sudo yum install git -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker ssm-user
id ec2-user ssm-user
sudo newgrp docker

#Ativar docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

#Instalar docker compose 2
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose


#Adicionar swap
sudo dd if=/dev/zero of=/swapfile bs=192M count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab


#Instalar node e npm
curl -fsSL https://rpm.nodesource.com/setup_21.x | sudo bash -
sudo yum install -y nodejs    
    EOF
    tags = {
        ambiente = "dev"
        Name = var.instance_name
    } 
    vpc_security_group_ids = [aws_security_group.bia_dev.id]
    root_block_device {
        volume_size = 15
    }
}

resource "aws_security_group" "bia_dev" {
  name        = "bia-dev"
  description = "Acesso HTTP e HTTPS para o servidor"
  vpc_id      = "vpc-02375163489f89ac2"

  ingress {
    description = "Acesso HTTP e HTTPS para o servidor"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Saida liberacao para tudo"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

