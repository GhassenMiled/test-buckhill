# Create vpc
resource "aws_vpc" "buckhill-test-vpc" {
  cidr_block           = var.buckhill-test-vpc-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "buckhill-test-vpc"
  }
}

# Create frontend subnet
resource "aws_subnet" "buckhill-test-front-subnet" {
   cidr_block        = var.buckhill-test-front-subnet-cidr
   vpc_id            = aws_vpc.buckhill-test-vpc.id
   availability_zone = var.buckhill-test-front-subnet-az

   tags = {
     Name = "buckhill-test-front-subnet"
   }
 }

# Create backend subnet
resource "aws_subnet" "buckhill-test-back-subnet" {
   cidr_block        = var.buckhill-test-back-subnet-cidr
   vpc_id            = aws_vpc.buckhill-test-vpc.id
   availability_zone = var.buckhill-test-back-subnet-az

   tags = {
     Name = "buckhill-test-back-subnet"
   }
 }

# Create rds-db subnet group
 resource "aws_db_subnet_group" "buckhill-test-db-subnet" {
  name       = "buckhill-test-db-subnet"
  subnet_ids = [aws_subnet.buckhill-test-back-subnet.id,aws_subnet.buckhill-test-front-subnet.id]

  tags = {
    Name = "buckhill-test-db-subnet"
  }
}