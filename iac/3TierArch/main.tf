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
    key    = "projects_statefile/infra_dev/terraform.state"
    region = "us-east-1"
  }
}

# VPC 
resource "aws_vpc" "cloudbinary_vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name       = "cloudbinary_vpc"
    Created_By = "Terraform"
  }
}

# Subnet
resource "aws_subnet" "cloudbinary_public_subnet1" {
  vpc_id                  = aws_vpc.cloudbinary_vpc.id
  cidr_block              = "10.0.1.0/28"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name       = "cloudbinary_public_subnet1"
    created_by = "Terraform"
  }
}
resource "aws_subnet" "cloudbinary_public_subnet2" {
  vpc_id                  = aws_vpc.cloudbinary_vpc.id
  cidr_block              = "10.0.2.0/28"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name       = "cloudbinary_public_subnet2"
    created_by = "Terraform"
  }
}

# Private 
resource "aws_subnet" "cloudbinary_private_subnet1" {
  vpc_id            = aws_vpc.cloudbinary_vpc.id
  cidr_block        = "10.0.3.0/28"
  availability_zone = "us-east-1a"

  tags = {
    Name       = "cloudbinary_private_subnet1"
    created_by = "Terraform"
  }
}
resource "aws_subnet" "cloudbinary_private_subnet2" {
  vpc_id            = aws_vpc.cloudbinary_vpc.id
  cidr_block        = "10.0.4.0/28"
  availability_zone = "us-east-1b"

  tags = {
    Name       = "cloudbinary_private_subnet2"
    created_by = "Terraform"
  }
}
resource "aws_subnet" "cloudbinary_private_subnet3" {
  vpc_id            = aws_vpc.cloudbinary_vpc.id
  cidr_block        = "10.0.5.0/28"
  availability_zone = "us-east-1a"

  tags = {
    Name       = "cloudbinary_private_subnet3"
    created_by = "Terraform"
  }
}
resource "aws_subnet" "cloudbinary_private_subnet4" {
  vpc_id            = aws_vpc.cloudbinary_vpc.id
  cidr_block        = "10.0.6.0/28"
  availability_zone = "us-east-1b"

  tags = {
    Name       = "cloudbinary_private_subnet4"
    created_by = "Terraform"
  }
}
resource "aws_subnet" "cloudbinary_private_subnet5" {
  vpc_id            = aws_vpc.cloudbinary_vpc.id
  cidr_block        = "10.0.7.0/28"
  availability_zone = "us-east-1a"

  tags = {
    Name       = "cloudbinary_private_subnet5"
    created_by = "Terraform"
  }
}
resource "aws_subnet" "cloudbinary_private_subnet6" {
  vpc_id            = aws_vpc.cloudbinary_vpc.id
  cidr_block        = "10.0.8.0/28"
  availability_zone = "us-east-1b"

  tags = {
    Name       = "cloudbinary_private_subnet6"
    created_by = "Terraform"
  }
}