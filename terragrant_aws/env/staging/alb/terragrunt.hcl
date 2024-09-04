include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/aws_alb"
}

dependency "network" {
  config_path = "../network"
  mock_outputs = {
    security_group_id = ""
    public_subnet_ids = ""
    vpc_id            = ""
    certificate_arn   = ""
  }
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
}



inputs = {
  env                = "staging"
  security_group_id  = [dependency.network.outputs.security_group_id]
  public_subnet_ids  = dependency.network.outputs.public_subnet_ids
  vpc_id             = "${dependency.network.outputs.vpc_id}"
  certificate_arn    = dependency.network.outputs.certificate_arn
}
