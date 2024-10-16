
resource "aws_instance" "this" {
  count = length(var.instance_names)
  ami                                  = data.aws_ami.this.id
  associate_public_ip_address          = false
  #  availability_zone                    = var.instance_az
  disable_api_termination              = false
  ebs_optimized                        = true
  get_password_data                    = false
  hibernation                          = false
  iam_instance_profile                 = aws_iam_instance_profile.this.id
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = var.instance_type
  key_name                             = aws_key_pair.this.key_name
  monitoring                           = true
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = true
  subnet_id                            = var.subnet_ids[count.index]
  tenancy                              = "default"
  user_data_replace_on_change          = false

  vpc_security_group_ids = [
    "${aws_security_group.this.id}"
  ]

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    tags                  = {}
    volume_size           = 100
    volume_type           = "gp2"
  }

  timeouts {}

  tags = {
    Name = var.instance_names[count.index]
    Env  = var.env
  }
}
# Pull the latest image matching nix release
data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = ["nixos/${var.instance_nix_release}.*-x86_64-linux"]
  }

  owners = ["427812963091"]
}
