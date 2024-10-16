resource "aws_security_group" "this" {
  name        = "${var.project_name}-${var.env}-sg"
  description = "Secuirty Group for Instance"
  vpc_id      = var.instance_vpc_id

  egress {
    description = "Egress to all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


