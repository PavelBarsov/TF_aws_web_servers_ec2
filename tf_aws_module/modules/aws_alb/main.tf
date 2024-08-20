# ALB (Application Load Balancer)
resource "aws_lb" "web_alb" {
  name               = "${var.env}-ALB-WebServer"
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnet_ids

  tags = {
    Name = "${var.env}-alb"
  }
}

# Target Group
resource "aws_lb_target_group" "web" {
  name                 = "${var.env}-TG-WebServer"
  vpc_id               = var.vpc_id
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 10

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name = "${var.env}-tg"
  }
}

# Listener for ALB on port 443 (HTTPS)
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }

  tags = {
    Name = "${var.env}-https-listener"
  }
}

# Listener for ALB on port 80 (HTTP) with redirection to HTTPS
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = {
    Name = "${var.env}-http-listener"
  }
}
