output "route53_record_name" {
  description = "The name of the Route 53 record"
  value       = aws_route53_record.web_alb_record.name
}

output "route53_record_fqdn" {
  description = "The FQDN of the Route 53 record"
  value       = aws_route53_record.web_alb_record.fqdn
}
