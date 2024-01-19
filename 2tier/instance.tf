# create web instance for az1

resource "aws_instance" "web1" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pub_subnet_az1.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key1.key_name


  tags = {
    Name = "${var.project_name}-web_instance_az1"
  }
}




# ubuntu ami 22.04 =  ami-0c7217cdde317cfec

# create app instance for az1

resource "aws_instance" "app-server-1" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pri_subnet_az1.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key2.key_name


  tags = {
    Name = "${var.project_name}-app_instance_az1"
  }
}



# create web instance for az2

resource "aws_instance" "web2" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pub_subnet_az2.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key1.key_name


  tags = {
    Name = "${var.project_name}-web_instance_az2"
  }
}


# create app instance for az1

resource "aws_instance" "app-server-2" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pri_subnet_az2.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key2.key_name


  tags = {
    Name = "${var.project_name}-app_instance_az2"
  }
}