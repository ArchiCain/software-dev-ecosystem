terraform {
  source = "../../../infrastructure-modules/ec2-instance/"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = find_in_parent_folders("env.hcl")
  expose = true
  merge_strategy = "no_merge"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    private_subnet_ids = ["subnet-1234", "subnet-5678", "subnet-0987"]
    vpc_id = "vpc-0d966b31234567890"
  }
}

inputs = {
  env             = include.env.locals.env
  project         = include.env.locals.project
  subnet_ids      = dependency.vpc.outputs.private_subnet_ids
  instance_names  = include.env.locals.instance_names
  instance_vpc_id = dependency.vpc.outputs.vpc_id
}
