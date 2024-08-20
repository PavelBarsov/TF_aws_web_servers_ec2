variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "allow_ports" {
  description = "List of ports to open"
  type        = list(any)
  default     = ["80", "22", "443", "8080"]
}

variable "domain_name" {
  type    = string
  default = "bpg-it.net"
}
