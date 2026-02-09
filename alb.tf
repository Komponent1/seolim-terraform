resource "aws_lb" "main" {
  name               = "seolim-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [
    aws_subnet.public_a.id,
    aws_subnet.public_c.id
  ]
  security_groups = [
    aws_security_group.alb_sg.id
  ]
}

resource "aws_lb_target_group" "main" {
  name     = "ec2-alb"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/ping"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}
