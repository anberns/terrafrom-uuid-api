variable "ecs_cluster_name" {
    type = string
}

variable "ecs_task_family_name" {
    type = string
}

variable "ecs_service_name" {
    type = string
}

variable "ecs_service_desired_count" {
    type = number
}

variable "ecs_sg_ids" {
    type = list(string)
}

variable "ecs_subnets" {
    type = list(string)
}

variable "image_uri" {
    type = string
}

variable "execution_role_arn" {
    type = string
}