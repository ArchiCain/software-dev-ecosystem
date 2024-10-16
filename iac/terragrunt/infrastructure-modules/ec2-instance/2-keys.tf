resource "aws_key_pair" "this" {
  key_name = "ec2-k3s-key-${var.env}"
  public_key = var.instance_public_key
}
