variable "ecr_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_task_family_name" {
  type = string
}

variable "sg_ingress_cidr_block" {
  type = list(string)
}

variable "subnet_cidr_block" {
  type = string
}

variable "ecs_service_desired_count" {
  type = number
}

variable "ecs_service_name" {
  type = string
}

variable "image_location" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "ecr_repo_name" {
  type = string
}

variable "ecs_task_role_name" {
  type = string
}