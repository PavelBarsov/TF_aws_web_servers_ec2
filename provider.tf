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
