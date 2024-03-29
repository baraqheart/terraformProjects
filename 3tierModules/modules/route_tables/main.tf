
## Create route table for public subnet  

resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
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



## Create route table for private subnet in az 1 

resource "aws_route_table" "private-rt-az1" {
  vpc_id = var.vpc_id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gw1_id
  }
  
  tags = {
    Name = "${var.project_name}-private-rt-az1"
  }
}


# create a route table association for private subnet

resource "aws_route_table_association" "private-rt-association-az1" {
  subnet_id      = [var.private_app_subnet_az1_id,var.private_db_subnet_az1_id]
  route_table_id = aws_route_table.private-rt-az1.id
}


## Create route table for private subnet in az 2

resource "aws_route_table" "private-rt-az2" {
  vpc_id = var.vpc_id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gw2_id
  }
  
  tags = {
    Name = "${var.project_name}-private-rt-az2"
  }
}


# create a route table association for private subnet

resource "aws_route_table_association" "private-rt-association-az2" {
  subnet_id      = [var.private_app_subnet_az2_id,var.private_db_subnet_az2_id]
  route_table_id = aws_route_table.private-rt-az2.id
}