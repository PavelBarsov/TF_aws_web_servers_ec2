variable "record_name" {
  description = "The name of the DNS record"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "ttl" {
  description = "The TTL (Time To Live) for the DNS record"
  type        = number
  default     = 300
}

variable "env" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "domain_name" {
  type = string
}

variable "region" {
  description = "Availability zone for subnets"
  type        = string
}
