
# create custom vpc for this project

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "${var.project_name}-vpc"
  }
}


# fetch data from availability list
data "aws_availability_zones" "azs" {}


# create public subnet for web server in az1

resource "aws_subnet" "pub-subnet-az1" {
  vpc_id     = var.vpc_cidr
  cidr_block = var.pub_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.azs[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-pub-subnet-az1"
  } 
}

# create private subnet for app server in az1

resource "aws_subnet" "private-app-subnet-az1" {
  vpc_id     = var.vpc_cidr
  cidr_block = var.private_app_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.azs[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-app-subnet-az1"
  } 
}


# create private subnet for database server in az1

resource "aws_subnet" "private-db-subnet-az1" {
  vpc_id     = var.vpc_cidr
  cidr_block = var.private_db_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.azs[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-db-subnet-az1"
  } 
}

# create public subnet for web server in az2

resource "aws_subnet" "pub-subnet-az2" {
  vpc_id     = var.vpc_cidr
  cidr_block = var.pub_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.azs[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-pub-subnet-az2"
  } 
}

# create private subnet for app server in az2

resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id     = var.vpc_cidr
  cidr_block = var.private_app_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.azs[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-app-subnet-az2"
  } 
}


# create private subnet for database server in az2

resource "aws_subnet" "private-db-subnet-az2" {
  vpc_id     = var.vpc_cidr
  cidr_block = var.private_db_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.azs[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-app-subnet-az2"
  } 
}
