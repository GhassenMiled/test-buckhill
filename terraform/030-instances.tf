resource "aws_key_pair" "buckhill-test-key-pair" {
  key_name   = var.buckhill-test-key-pair-name
  public_key = var.buckhill-test-key-pair-public-key
}


data "aws_ami" "buckhill-test-ubuntu-ami" {
  most_recent = true
  owners = [var.canonical-account-number]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-????????"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

}

resource "aws_instance" "buckhill-test-ec2-instance" {
  ami           = data.aws_ami.buckhill-test-ubuntu-ami.id
  instance_type = var.buckhill-test-instance-type
  subnet_id = aws_subnet.buckhill-test-front-subnet.id
  vpc_security_group_ids = [aws_security_group.buckhill-test-ec2-sg.id]
  key_name = aws_key_pair.buckhill-test-key-pair.key_name
  
  tags = {
    Name = "buckhill-test-ec2-instance"
  }
  
}

resource "aws_eip" "buckhill-test-eip" {
  instance = aws_instance.buckhill-test-ec2-instance.id
  vpc      = true
}