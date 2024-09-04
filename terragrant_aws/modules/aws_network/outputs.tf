output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public_subnet[*].id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.web-sg.id
}

output "vpc_id" {
  description = "The ID of the security group"
  value       = aws_vpc.main.id
}

output "certificate_arn" {
  value = data.aws_acm_certificate.selected.arn
}
