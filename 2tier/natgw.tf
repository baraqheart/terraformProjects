# create elastic ip 
resource "aws_eip" "eip1" {
  instance = aws_instance.web1.id
  domain   = "vpc"
}

# create a nat gateway for az1

resource "aws_nat_gateway" "nat_az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.pub_subnet_az1.id

  tags = {
    Name = "${var.project_name}-nat_az1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


# create elastic ip for availability zone 2
resource "aws_eip" "eip2" {
  instance = aws_instance.web1.id
  domain   = "vpc"
}

# create a nat gateway for availability zone 2

resource "aws_nat_gateway" "nat_az2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.pub_subnet_az2.id

  tags = {
    Name = "${var.project_name}-nat_az2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}