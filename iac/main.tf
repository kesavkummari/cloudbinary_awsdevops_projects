# Versions 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}

# Authentication to AWS from Terraform code
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "8amcloudbinary"
    key    = "projects_statefile/terraform.state"
    region = "us-east-1"
  }
}

# Continuous Integration - Jenkins
resource "aws_instance" "cloudbinary_jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-0ad9e2e746e28693b"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file("jenkins.sh")
  tags = {
    Name      = "cloudbinary_Jenkins"
    CreatedBy = "Terraform"
  }
}

# Continuous Integration - Jenkins
resource "aws_instance" "cloudbinary_sonarqube" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-0ad9e2e746e28693b"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file("sonarqube.sh")
  tags = {
    Name      = "cloudbinary_sonarqube"
    CreatedBy = "Terraform"
  }
}