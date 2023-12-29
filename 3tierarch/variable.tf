variable "region" {}
variable "project_name" {}

variable "vpc_cidr" {}

variable "pub_subnet_az1_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_db_subnet_az1_cidr" {}


variable "pub_subnet_az2_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_db_subnet_az2_cidr" {}


variable "inst_type" {}
variable "amis" {}
variable "web-key" {}
variable "app-key" {}
variable "db-key" {}