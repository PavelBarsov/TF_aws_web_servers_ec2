resource "aws_autoscaling_group" "web" {
  name                = "${var.env}-ASG-WebServer-${aws_launch_template.web.latest_version}"
  min_size            = var.desired_capacity
  max_size            = var.desired_capacity
  desired_capacity    = var.desired_capacity
  health_check_type   = "ELB"
  vpc_zone_identifier = var.public_subnet_ids
  target_group_arns   = var.target_group_arn

  launch_template {
    id      = aws_launch_template.web.id
    version = aws_launch_template.web.latest_version
  }

  tag {
    key                 = "Name"
    value               = "${var.env}-webserver"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "web" {
  name                   = "${var.env}-LT-Web-server"
  image_id               = data.aws_ami.amazon_linux_2_latest.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  user_data              = var.user_data_base64

  tags = {
    Name = "${var.env}-launch-template"
  }
}
