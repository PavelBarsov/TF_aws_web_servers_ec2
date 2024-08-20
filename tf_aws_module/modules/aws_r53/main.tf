resource "aws_route53_record" "web_alb_record" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "CNAME"
  ttl     = var.ttl
  records = [var.alb_dns_name]
}
