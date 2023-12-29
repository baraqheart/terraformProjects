
# create web server for az1

resource "aws_instance" "web" {
  ami           = var.amis
  instance_type = var.inst_type
  associate_public_ip_address = true
  security_groups = []
  key_name = var.web-key
  subnet_id = aws_subnet.pub-subnet-az1.id
  user_data = file("")

  tags = {
    Name = "${project_name}-web-server-az1"
  }
}





# create app server for az1







# create database server for az1








# create web server for az2








# create app server for az2







# create database server for az2