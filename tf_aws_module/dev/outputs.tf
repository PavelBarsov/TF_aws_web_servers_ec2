output "region" {
  value = var.region
}

output "web_addres" {
  value = module.r53.route53_record_name
}
