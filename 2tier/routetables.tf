# Public route table 
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = aws_vpc.vpc.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "${var.project_name}-pub-rt"
  }
}


# Public route table association
resource "aws_route_table_association" "pub-rt-a" {
  subnet_id      = aws_subnet.pub_subnet_az1.id
  route_table_id = aws_route_table.pub-rt.id
}

####__________________________________________

# Private route table
resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = aws_vpc.vpc.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "${var.project_name}-pri-rt"
  }
}


# Private route table association
resource "aws_route_table_association" "pri-rt-a" {
  subnet_id      = aws_subnet.pri_subnet_az1.id
  route_table_id = aws_route_table.pri-rt.id
}