#create elastic ip for nat in az1

resource "aws_eip" "eip1" {
  instance = var.jump1
  domain   = "vpc"

}


# create nat gateway for az 1

resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = var.pub_subnet_az1_id

  tags = {                          
    Name = "${var.project_name}-nat1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


#create elastic ip for nat in az 2

resource "aws_eip" "eip2" {
  instance = var.jump2
  domain   = "vpc"

}


# create nat gateway for az 2

resource "aws_nat_gateway" "nat_gw2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = var.pub_subnet_az2_id

  tags = {                          
    Name = "${var.project_name}-nat2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}