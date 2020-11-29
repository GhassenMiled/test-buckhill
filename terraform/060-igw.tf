resource "aws_internet_gateway" "buckhill-test-vpc-igw" {
  vpc_id = aws_vpc.buckhill-test-vpc.id

  tags = {
    Name = "buckhill-test-vpc-igw"
  }
}

resource "aws_route" "buckhill-test-internet-gw-route" {
  route_table_id         = aws_route_table.buckhill-test-route-table.id
  gateway_id             = aws_internet_gateway.buckhill-test-vpc-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

