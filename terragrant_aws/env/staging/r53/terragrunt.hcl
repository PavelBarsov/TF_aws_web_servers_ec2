include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/aws_r53"
}

dependency "alb" {
  config_path = "../alb"
  mock_outputs = {
    alb_dns_name = ""
  }
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
}

inputs = {
  env          = "staging"
  domain_name  = "bpg-it.net"
  record_name  = "staging.bpg-it.net"
  alb_dns_name = dependency.alb.outputs.alb_dns_name
  ttl          = 10
}
