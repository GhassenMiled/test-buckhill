# Specify region and profile
buckhill-test-region = "us-east-1"
buckhill-test-profile = "default"

# Specify networking informations
buckhill-test-vpc-cidr = "10.100.0.0/16"
buckhill-test-front-subnet-cidr = "10.100.1.0/24"
buckhill-test-back-subnet-cidr = "10.100.2.0/24"
buckhill-test-front-subnet-az  = "us-east-1a"
buckhill-test-back-subnet-az  = "us-east-1b"

# Specify Compute informations
canonical-account-number = "099720109477"
buckhill-test-instance-type = "t2.micro"
buckhill-test-key-pair-name = "task_key_pair"
buckhill-test-key-pair-public-key = "ssh-rsa ..."

# Specify RDS informations
buckhill-test-rds-db-name   = "mydb"
buckhill-test-rds-user-name = "user"
buckhill-test-rds-user-password  = "Azerty123456"
