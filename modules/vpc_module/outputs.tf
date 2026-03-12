output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = [
    aws_subnet.az1.id,
    aws_subnet.az2.id,
    aws_subnet.az3.id
  ]
}

output "security_group_id" {
  value = aws_security_group.this.id
}
