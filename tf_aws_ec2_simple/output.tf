output "web_loadbalancer_url" {
  value = aws_lb.web_alb.dns_name
}

output "region" {
  value = var.region
}

output "web_addres" {
  value = aws_route53_record.web_alb_record.name
}
