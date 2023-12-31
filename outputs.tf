output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "sg_id" {
  value = module.vpc.sg_id
}

output "sg_arn" {
  value = module.vpc.sg_arn
}

output "ecr_repository_url" {
  value = data.aws_ecr_repository.uuid_api.repository_url
}
