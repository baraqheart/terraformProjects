provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
region = var.region
project_name = var.project_name
vpc_cidr = var.vpc_cidr
pub_subnet_az1_cidr = var.pub_subnet_az1_cidr
private_app_subnet_az1_cidr = var.private_app_subnet_az1_cidr
private_db_subnet_az1_cidr = var.private_db_subnet_az1_cidr 
pub_subnet_az2_cidr = var.pub_subnet_az2_cidr
private_app_subnet_az2_cidr = var.private_app_subnet_az2_cidr
private_db_subnet_az2_cidr = var.private_db_subnet_az2_cidr

}

module "secgrp" {
  source = "./modules/sg"
  vpc_id = module.vpc_id
  project_name = module.vpc.project_name
}

