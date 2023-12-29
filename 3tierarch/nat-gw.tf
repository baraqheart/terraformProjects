
# create elastic ip for nat allocation

resource "aws_eip" "nat-eip" {
  instance = aws_instance.web-az1.id
  domain   = "vpc"
}

# create NAT gateway for private subnets

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.pub-subnet-az1.id

  tags = {
    Name = "${var.project_name}-NAT-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}