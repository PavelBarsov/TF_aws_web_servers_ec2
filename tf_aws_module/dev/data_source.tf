data "aws_availability_zones" "available" {}

data "aws_ami" "amazon_linux_2_latest" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_route53_zone" "public" {
  name = var.domain_name
}

data "aws_acm_certificate" "selected" {
  domain      = "*.bpg-it.net"
  most_recent = true
}
