output "ecs_cluster_id" {
    value = aws_ecs_cluster.uuid_api.id
}

output "ecs_cluster_arn" {
    value = aws_ecs_cluster.uuid_api.arn
}