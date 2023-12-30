output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "pub_subnet_az1_id" {
  value = aws_subnet.pub-subnet-az1.id
}

output "private_app_subnet_az1_id" {
  value = aws_subnet.private-app-subnet-az1.id
}

output "private_app_subnet_az2_id" {
  value = aws_subnet.private-db-subnet-az1.id
}

output "pub_subnet_az2_id" {
  value = aws_subnet.pub-subnet-az2.id
}
