# Terraform Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "deepak_new_2" {
 instance_type = "t2.micro" 
 ami     = data.aws_ami.amzlinux2.id
 tags = {
 Name = "deepak_instance"
 }
 user_data = file("${path.module}/data.sh")
 vpc_security_group_ids = [aws_security_group.allow_ports.id]
   }


resource "aws_security_group" "allow_ports" {
   name        = "allow_ssh_http_ports"
   description = "Allow inbound SSH traffic and http from any IP"

   #ssh access
   ingress {
       from_port   = 22
       to_port     = 22
       protocol    = "tcp"
       # Restrict ingress to necessary IPs/ports.
       cidr_blocks = ["0.0.0.0/0"]
   }

   # HTTP access
   ingress {
       from_port   = 80
       to_port     = 80
       protocol    = "tcp"
       # Restrict ingress to necessary IPs/ports.
       cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
       from_port   = 0
       to_port     = 0
       protocol    = "-1"
       cidr_blocks = ["0.0.0.0/0"]
   }
  
}
