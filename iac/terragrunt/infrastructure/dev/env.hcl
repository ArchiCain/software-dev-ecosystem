locals {
  env            = "dev"
  project        = "k3s"
  azs            = ["us-east-1a", "us-east-1b", "us-east-1c"]
  instance_names = ["k3s-dev02", "k3s-dev01", "k3s-dev00"]
}
