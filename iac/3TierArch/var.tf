variable "ami" {
  default = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "cb_aws_nv_keys"
}

variable "subnet_id" {
  default = "subnet-0385704f22e343550"
}

variable "vpc_security_group_ids" {
  default = "sg-0ad9e2e746e28693b"
}

variable "iam_instance_profile" {
  default = "8amSSMEC2"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}
