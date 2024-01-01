resource "aws_ecs_cluster" "uuid_api" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "uuid_api" {
  family                = "uuid-api-task"
  network_mode          = "awsvpc"
  memory                = "512"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = var.execution_role_arn

  container_definitions = <<DEFINITION
    [
      {
        "name": "${var.ecs_task_family_name}",
        "image": "${var.image_uri}",
        "essential": true,
        "cpu": 256,
        "memory": 512,
        "portMappings": [
          {
            "containerPort": 5000,
            "hostPort": 5000,
            "protocol": "tcp"
          }
        ],
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "${aws_cloudwatch_log_group.uuid_api_log_group.name}",
            "awslogs-region": "us-east-1",
            "awslogs-stream-prefix": "ecs"
          }
        }
      }
    ]
    DEFINITION

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

resource "aws_cloudwatch_log_group" "uuid_api_log_group" {
  name = "/ecs/uuid-api-logs"
  retention_in_days = 1
}
