# Show EIP address ec2
output "buckhill-test-ec2-instance-eip" {
  value = aws_eip.buckhill-test-eip.public_ip
}

# Show RDS Endpoint
output "buckhill-test-rds-endpoint" {
  value = aws_db_instance.buckhill-test-rds.endpoint
}
