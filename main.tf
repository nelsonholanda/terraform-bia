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
    tags = {
        ambiente = "dev"
        Name = var.instance_name
    } 
    vpc_security_group_ids = [aws_security_group.bia_tf.id]
    root_block_device {
        volume_size = 10
    }
}

resource "aws_security_group" "bia_tf" {
  name        = "bia-tf"
  description = "Acesso HTTP e HTTPS para o servidor"
  vpc_id      = "vpc-02375163489f89ac2"

  ingress {
    description = "Entrada liberacao bia"
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