# Outputs for ALB and Target Group ARNs
output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.web_alb.arn
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.web.arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.web_alb.dns_name
}
