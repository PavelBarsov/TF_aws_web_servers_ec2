resource "aws_route53_record" "web_alb_record" {
  zone_id = data.aws_route53_zone.public.id
  name    = "www.albweb.${data.aws_route53_zone.public.name}"
  type    = "CNAME"
  ttl     = 10
  records = [aws_lb.web_alb.dns_name]
}
