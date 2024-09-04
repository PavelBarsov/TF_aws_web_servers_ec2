data "aws_acm_certificate" "selected" {
  domain      = "*.bpg-it.net"
  most_recent = true
}
