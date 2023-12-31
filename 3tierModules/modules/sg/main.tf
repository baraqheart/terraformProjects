# create security group for jumpserver

resource "aws_security_group" "jump-secgrp" {
  name        = "jump-sg"
  description = "this security group allows connection to the jump server"
  vpc_id      = var.vpc_id

  ingress {
    description      = "this allows https connection on port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "this allows http connection on port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "this allows ssh connection on port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = []
      }
   
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-jump-sg"
  }
}


# create security group for app server

resource "aws_security_group" "app-secgrp" {
  name        = "app-sg"
  description = "this security group allows connection in to the app server"
  vpc_id      = var.vpc_id

 
  ingress {
    description      = "this allows ssh conection from the jump sg on port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_security_group.jump-secgrp.id]
      }
   
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${project_name}-app-sg"
  }
}


# create security group for database server

resource "aws_security_group" "db-secgrp" {
  name        = "db-sg"
  description = "this allows connection on db server"
  vpc_id      = var.vpc_id

 
  ingress {
    description      = "this allows ssh connection from jump server"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_security_group.jump-secgrp.id]
      }
   
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}



# create security group for application load balancer

resource "aws_security_group" "alb-secgrp" {
  name        = "alb-sg"
  description = "this allows connection to alb"
  vpc_id      = ""

  ingress {
    description      = "this allows https connection on alb from app"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_security_group.app-secgrp.id]
  }
  
  ingress {
    description      = ""
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = []
  }

  ingress {
    description      = ""
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = []
      }
   
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${project_name}-alb-sg"
  }
}