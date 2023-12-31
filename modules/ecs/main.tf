resource "aws_ecs_cluster" "uuid_api" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "uuid_api" {
  family                = "uuid-api-task"
  network_mode          = "awsvpc"
  memory                = "512"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = var.ecs_task_family_name
      image     = var.image_uri
      cpu       = 256
      memory    = 512
      port_mappings = [
        {
          container_port = 5000
          host_port      = 5000
          protocol       = "tcp"
        }
      ]
    }
  ])

  cpu = "256"  
}

resource "aws_ecs_service" "uuid_api" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.uuid_api.id
  task_definition = aws_ecs_task_definition.uuid_api.arn
  desired_count   = var.ecs_service_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.ecs_subnets
    security_groups  = var.ecs_sg_ids
    assign_public_ip = true
  }
}
