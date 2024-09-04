include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/aws_network"
}

inputs = {
  vpc_cidr           = "192.168.0.0/16"
  env                = "dev"
  public_subnets     = ["192.168.1.0/24", "192.168.2.0/24"]
  azs                = ["us-east-1a", "us-east-1b"]
  public_subnet_name = ["public_subnet_1", "public_subnet_2"]
  allow_ports        = ["80", "22", "443", "8080"]
}