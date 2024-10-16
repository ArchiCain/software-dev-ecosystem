output "ec2-instance-ids" {
  value = aws_instance.this[*].id
}
