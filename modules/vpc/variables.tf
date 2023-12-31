variable "vpc_cidr_block" {
    type = string
}

variable "sg_ingress_cidr_block" {
    type = list(string)
}

variable "subnet_cidr_block" {
    type = string
}