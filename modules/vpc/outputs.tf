output "vpc_id" {
    value = aws_vpc.uuid_api.id
}

output "vpc_arn" {
    value = aws_vpc.uuid_api.arn
}

output "sg_id" {
    value = aws_security_group.uuid_api.id
}

output "sg_arn" {
    value = aws_security_group.uuid_api.arn
}

output "subnet_id" {
    value = aws_subnet.uuid_api.id
}