# Elastic load balancer

resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.pub_subnet_az1.id, aws_subnet.pub_subnet_az2.id]

  enable_deletion_protection = true

  tags = {
    Environment = "development"
    Name        = "${var.project_name}-alb"
  }
}

#Target group

resource "aws_lb_target_group" "tg" {
  name        = "bankapp-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id


  health_check {
    enabled             = true
    matcher             = 200
    unhealthy_threshold = 5
    healthy_threshold   = 5
    path                = "/"
    interval            = 300
    timeout             = 60

  }
}

