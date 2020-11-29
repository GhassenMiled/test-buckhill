variable "buckhill-test-region" {
  type = string
  description = "buckhill test AWS region"
  default     = "eu-west-1"
}

variable "buckhill-test-profile" {
  type = string
  description = "buckhill test IAM profile"
}

variable "buckhill-test-vpc-cidr" {
  type = string
  description = "buckhill test VPC CIDR Block"
}

variable "buckhill-test-instance-type" {
  type = string
  description = "buckhill test EC2 Instance type to launch"
}

variable "buckhill-test-key-pair-name" {
  type = string
  description = "buckhill test Keypair to use to connect to EC2 Instances"
}

variable "buckhill-test-key-pair-public-key" {
  type = string
  description = "buckhill test Keypair to use to connect to EC2 Instances"
}

variable "buckhill-test-front-subnet-cidr" {
  type = string
  description = "buckhill test Frontend Subnet CIDR"
}

variable "buckhill-test-back-subnet-cidr" {
  type = string
  description = "buckhill test Backend Subnet CIDR"
}

variable "buckhill-test-back-subnet-az" {
  type = string
  description = "buckhill test Backend Subnet availability zone"
}

variable "buckhill-test-front-subnet-az" {
  type = string
  description = "buckhill test Frontend Subnet availability zone"
}

variable "canonical-account-number" {
  type = string
  description = "Canonical AWS account number to get AMIs from"
  default     = "099720109477"
}

variable "buckhill-test-rds-db-name" {
  type = string
  description = "buckhill test RDS DB name"
}

variable "buckhill-test-rds-user-name" {
  type = string
  description = "buckhill test RDS user name"
}

variable "buckhill-test-rds-user-password" {
  type = string
  description = "buckhill test RDS user password"
}