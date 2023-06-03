
resource "aws_vpc" "primary" {
    cidr_block           = "10.6.0.0/16"
    tags = {
      name = "dartsly-primary-vpc"
    }
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.primary.id
    cidr_block = "10.6.0.0/24"

}

resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.primary.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.primary.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
    vpc_id = aws_vpc.primary.id

   ingress {
    from_port   = 80  # HTTP port
    to_port     = 6443 # k3s port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Update with your desired source IP range
  }

  egress {
    from_port   = 0 # k3s port
    to_port     = 0 # HTTP port
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}