resource "aws_launch_template" "web" {
  name                   = "Web_server_ha"
  image_id               = data.aws_ami.amazon_linux_2_latest.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = filebase64("${path.module}/user_data.sh")
}
