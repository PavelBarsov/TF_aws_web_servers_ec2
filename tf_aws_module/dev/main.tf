provider "aws" {
  region                   = var.region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"

  default_tags {
    tags = {
      Owner    = "Pavel Barsau"
      CreateBy = "TF"
      Project  = "Web_DevOps_test"
    }
  }
}

locals {
  vpc_cidr             = "192.168.0.0/16"
  azs                  = slice(data.aws_availability_zones.available.names, 0, 2)
  env                  = "dev"
  public_subnets_names = ["public_subnet_1", "public_subnet_2"]
  user_data            = "${path.module}/user_data.sh"
  record_prefix        = "devweb"
}

module "network" {
  source             = "../modules/aws_network"
  vpc_cidr           = local.vpc_cidr
  env                = local.env
  public_subnets     = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  azs                = local.azs
  public_subnet_name = local.public_subnets_names
  allow_ports        = var.allow_ports
}

module "alb" {
  source          = "../modules/aws_alb"
  env             = local.env
  security_groups = [module.network.security_group_id]
  subnet_ids      = module.network.public_subnet_ids
  vpc_id          = module.network.vpc_id
  certificate_arn = data.aws_acm_certificate.selected.arn
}

module "r53" {
  source       = "../modules/aws_r53"
  env          = local.env
  zone_id      = data.aws_route53_zone.public.zone_id
  record_name  = "${local.record_prefix}.${data.aws_route53_zone.public.name}"
  alb_dns_name = module.alb.alb_dns_name
  ttl          = 10
}

module "ec2" {
  source            = "../modules/aws_ec2"
  env               = local.env
  instance_type     = var.instance_type
  user_data_base64  = base64encode(file(local.user_data))
  security_group_id = module.network.security_group_id
  subnet_ids        = module.network.public_subnet_ids
  target_group_arns = [module.alb.target_group_arn]
  ami_id            = data.aws_ami.amazon_linux_2_latest.id
}
