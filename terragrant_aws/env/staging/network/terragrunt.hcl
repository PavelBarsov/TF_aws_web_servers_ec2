include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/aws_network"
}

inputs = {
  vpc_cidr           = "10.10.0.0/16"
  env                = "staging"
  public_subnets     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_name = ["public_subnet_1", "public_subnet_2", "public_subnet_3"]
  allow_ports        = ["80", "22", "443", "8080"]
}