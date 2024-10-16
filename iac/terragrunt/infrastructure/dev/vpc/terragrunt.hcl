terraform {
  source = "../../../infrastructure-modules/vpc/"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = find_in_parent_folders("env.hcl")
  expose = true
  merge_strategy = "no_merge"
}

inputs = {
  env             = include.env.locals.env
  azs             = include.env.locals.azs
  project         = include.env.locals.project
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.10.0/24", "10.10.11.0/24", "10.10.12.0/24"]

  private_subnet_tags = {}
  public_subnet_tags  = {}
}

