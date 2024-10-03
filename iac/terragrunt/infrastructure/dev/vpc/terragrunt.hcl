terraform {
  source = "../../../infrastructure-modules/vpc/"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env             = "k3s-dev"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24"]
  public_subnets  = ["10.10.10.0/24", "10.10.11.0/24"]

  private_subnet_tags = {}
  public_subnet_tags  = {}
}

