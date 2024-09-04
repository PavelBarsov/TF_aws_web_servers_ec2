variable "env" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "security_group_id" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the SSL certificate to be used for HTTPS"
  type        = string
}

variable "region" {
  description = "Availability zone for subnets"
  type        = string
}
