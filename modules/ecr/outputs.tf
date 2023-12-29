output "ecr_arn" {
    value = aws_ecr_repository.uuid-api.arn
}

output "ecr_registry_id" {
    value = aws_ecr_repository.uuid-api.registry_id
}

output "ecr_registry_url" {
    value = aws_ecr_repository.uuid-api.repository_url
}
