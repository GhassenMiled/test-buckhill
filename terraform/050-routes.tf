resource "aws_route_table" "buckhill-test-route-table" {
  vpc_id = aws_vpc.buckhill-test-vpc.id

  tags = {
    Name = "buckhill-test-route-table"
  }
}

resource "aws_route_table_association" "buckhill-test-front-subnet-association" {
  route_table_id = aws_route_table.buckhill-test-route-table.id
  subnet_id      = aws_subnet.buckhill-test-front-subnet.id
}

resource "aws_route_table_association" "buckhill-test-back-subnet-association" {
  route_table_id = aws_route_table.buckhill-test-route-table.id
  subnet_id      = aws_subnet.buckhill-test-back-subnet.id
}


