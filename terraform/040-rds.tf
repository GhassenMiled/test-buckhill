resource "aws_db_instance" "buckhill-test-rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = var.buckhill-test-rds-db-name
  username             = var.buckhill-test-rds-user-name
  password             = var.buckhill-test-rds-user-password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = "true"
  db_subnet_group_name = aws_db_subnet_group.buckhill-test-db-subnet.name
  vpc_security_group_ids = [aws_security_group.buckhill-test-rds-sg.id]
}
