# 7. Application Load Balancer (ALB)

resource "aws_lb" "main" {
  name                       = "omero-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.alb_sg_id]
  subnets                    = var.public_subnet_all_id
  enable_deletion_protection = false

  tags = {
    Name = "${var.vpc_name}-ALB"
  }
}

resource "aws_lb_target_group" "app" {
  name        = "omero-app-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_main_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.app.arn
    type             = "forward"
  }
}
