data "aws_availability_zones" "available" {}

data "aws_route53_zone" "public" {
  name = var.domain_name
}

data "aws_acm_certificate" "selected" {
  domain      = "*.bpg-it.net"
  most_recent = true
}
