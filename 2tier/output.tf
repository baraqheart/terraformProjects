output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "pub_sub_az1_cidr" {
  value = aws_subnet.pub_subnet_az1.cidr_block

}

output "pri_sub_az1_cidr" {
  value = aws_subnet.pri_subnet_az1.cidr_block

}

output "pub_sub_az2_cidr" {
  value = aws_subnet.pub_subnet_az2.cidr_block

}

output "pri_sub_az2_cidr" {
  value = aws_subnet.pub_subnet_az2.cidr_block

}