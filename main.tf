provider "aws" {
  region  = "us-east-1"
}

module "ecr" {
  source  = "./modules/ecr"
  name = var.ecr_name
}
