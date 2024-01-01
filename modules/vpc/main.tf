resource "aws_vpc" "uuid_api" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_security_group" "uuid_api" {
  vpc_id = aws_vpc.uuid_api.id
  name   = "uuid-api-security-group"
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = var.sg_ingress_cidr_block
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "uuid_api" {
  vpc_id     = aws_vpc.uuid_api.id
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "uuid_api" {
  vpc_id = aws_vpc.uuid_api.id
}

resource "aws_route_table" "uuid_api" {
  vpc_id = aws_vpc.uuid_api.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.uuid_api.id
  }
}

resource "aws_route" "uuid_api" {
  route_table_id         = aws_route_table.uuid_api.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.uuid_api.id
}

resource "aws_route_table_association" "uuid_api" {
  subnet_id      = aws_subnet.uuid_api.id
  route_table_id = aws_route_table.uuid_api.id
}
