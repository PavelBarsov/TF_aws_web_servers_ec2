variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "env" {
  description = "environment"
  type        = string
}

variable "azs" {
  description = "Availability zone for subnets"
  type        = list(string)
}


variable "public_subnets" {
  description = "CIDR block for public subnet"
  type        = list(string)
}

variable "public_subnet_name" {
  description = "Name for public subnet"
  type        = list(string)
}

variable "allow_ports" {
  description = "List of ports to open"
  type        = list(string)
}

variable "region" {
  description = "Availability zone for subnets"
  type        = string
}
