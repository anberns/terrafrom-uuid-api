provider "aws" {
  region = "us-east-1"
}

data "aws_ecr_repository" "uuid_api" {
  name = var.ecr_repo_name
}

data "aws_iam_role" "uuid_api" {
  name = var.ecs_task_role_name
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr_block        = var.vpc_cidr_block
  sg_ingress_cidr_block = var.sg_ingress_cidr_block
  subnet_cidr_block     = var.subnet_cidr_block
}

module "ecs" {
  source                    = "./modules/ecs"
  ecs_cluster_name          = var.ecs_cluster_name
  image_uri                 = "${data.aws_ecr_repository.uuid_api.repository_url}:${var.image_tag}"
  ecs_task_family_name      = var.ecs_task_family_name
  ecs_service_name          = var.ecs_service_name
  ecs_service_desired_count = var.ecs_service_desired_count
  ecs_sg_ids                = [module.vpc.sg_id]
  ecs_subnets               = [module.vpc.subnet_id]
  execution_role_arn = data.aws_iam_role.uuid_api.arn
}