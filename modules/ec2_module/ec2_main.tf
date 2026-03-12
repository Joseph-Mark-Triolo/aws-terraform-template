
resource "aws_instance" "this" { # The ec2 instance itself.
  ami                         = data.aws_ami.aws_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment}ec2-instance-name"
  }
}

resource "aws_security_group" "ec2_sg" { # Security group for ec2 instance
  name   = "${var.environment}-ec2-sg-name"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ssh" { # Allow ssh access
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0" # Best to assign to your network VPN address
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "SSH Access"
  tags = {
    Name = "${var.environment}-ssh-ingress"
  }
}

# resource "aws_vpc_security_group_egress_rule" "outbound" {
#   security_group_id = aws_security_group.ec2_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1"
#   description       = "Allow all outbound"
#   tags = {
#     Name = "${var.environment}-ssh-ingress"
#   }
# }
