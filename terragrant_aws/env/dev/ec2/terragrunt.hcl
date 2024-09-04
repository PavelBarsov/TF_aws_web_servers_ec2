include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/aws_ec2"
}

dependency "network" {
  config_path = "../network"
  mock_outputs = {
    security_group_id = ""
    public_subnet_ids = ""
  }
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
}


dependency "alb" {
  config_path = "../alb"
  mock_outputs = {
    target_group_arn = ""
  }
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
}

inputs = {
  env               = "dev"
  instance_type     = "t2.micro"
  user_data_base64  = base64encode(file("${get_terragrunt_dir()}/../user_data.sh"))
  security_group_id = dependency.network.outputs.security_group_id
  public_subnet_ids = dependency.network.outputs.public_subnet_ids
  target_group_arn  = [dependency.alb.outputs.target_group_arn]
  desired_capacity  = 2
}
