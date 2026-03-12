
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_security_group" "this" {
  name        = "name-of-your-sg"
  description = "Security group for VPC"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "az1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.az1_cidr_block
  availability_zone = "ap-southeast-2a"
  tags = {
    Name = "ap-southeast-2a"
  }
}

resource "aws_subnet" "az2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.az2_cidr_block
  availability_zone = "ap-southeast-2b"
  tags = {
    Name = "ap-southeast-2b"
  }
}

resource "aws_subnet" "az3" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.az3_cidr_block
  availability_zone = "ap-southeast-2c"
  tags = {
    Name = "ap-southeast-2c"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "az1" {
  subnet_id      = aws_subnet.az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "az2" {
  subnet_id      = aws_subnet.az2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "az3" {
  subnet_id      = aws_subnet.az3.id
  route_table_id = aws_route_table.public.id
}
