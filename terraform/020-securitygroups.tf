resource "aws_security_group" "buckhill-test-ec2-sg" {
  name        = "buckhill-test-ec2-sg"
  description = "buckhill test ec2 security group"
  vpc_id      = aws_vpc.buckhill-test-vpc.id

  lifecycle {
    create_before_destroy = true
  }
  
  tags = {
    Name = "buckhill-test-ec2-sg"
  }
}

resource "aws_security_group" "buckhill-test-rds-sg" {
  name        = "buckhill-test-rds-sg"
  description = "buckhill test RDS security group"
  vpc_id      = aws_vpc.buckhill-test-vpc.id

  lifecycle {
    create_before_destroy = true
  }
  
  tags = {
    Name = "buckhill-test-rds-sg"
  }
}

resource "aws_security_group_rule" "buckhill-test-sg-allow-ingress-ec2-rule" {
  type            = "ingress"
  protocol        = "tcp"
  from_port       = 3306
  to_port         = 3306
  source_security_group_id = aws_security_group.buckhill-test-ec2-sg.id
  security_group_id = aws_security_group.buckhill-test-rds-sg.id
}



resource "aws_security_group_rule" "buckhill-test-ec2-sg-allow-ingress-ssh-rule" {
  type            = "ingress"
  protocol        = "tcp"
  from_port       = 22
  to_port         = 22
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = aws_security_group.buckhill-test-ec2-sg.id
}

resource "aws_security_group_rule" "buckhill-test-ec2-sg-allow-ingress-web-rule" {
  type            = "ingress"
  protocol        = "tcp"
  from_port       = 80
  to_port         = 80
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = aws_security_group.buckhill-test-ec2-sg.id
}

resource "aws_security_group_rule" "buckhill-test-ec2-sg-allow-egress-rule" {
  type            = "egress"
  protocol        = "-1"
  from_port       = 0
  to_port         = 0
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = aws_security_group.buckhill-test-ec2-sg.id
}
