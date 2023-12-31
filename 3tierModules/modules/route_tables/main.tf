
## Create route table for public subnet  

resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
 }
  
  tags = {
    Name = "${var.project_name}-public-rt"
  }
}


# create an association for public subnet

resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = [var.pub_subnet_az1_id,var.pub_subnet_az2_id]
  route_table_id = aws_route_table.public-rt.id
}



## Create route table for private subnet

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = ""
    gateway_id = aws_nat_gateway.nat-gw.id
  }
  
  tags = {
    Name = "${var.project_name}-private-rt"
  }
}


# create a route tableee association for private subnet

resource "aws_route_table_association" "private-rt-association" {
  subnet_id      = [var.private_app_subnet_az1_id,var.private_app_subnet_az2_id]
  route_table_id = aws_route_table.private-rt.id
}