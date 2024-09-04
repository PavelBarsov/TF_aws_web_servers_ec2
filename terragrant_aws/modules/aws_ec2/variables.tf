variable "env" {
  description = "environment"
  type        = string
}

variable "instance_type" {
  description = "instance_type"
  type        = string
}

variable "user_data_base64" {
  description = "Base64 encoded user data"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for EC2 instances"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of subnet IDs where instances will be launched"
  type        = list(string)
}

variable "target_group_arn" {
  description = "List of Target Group ARNs for the ASG"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "region" {
  description = "Availability zone for subnets"
  type        = string
}
