variable "env" {
  description = "Environment name."
  type        = string
}

variable "project_name" {
  description = "The name of this project"
  type        = string
  default     = "k3s"
}

variable "instance_names" {
  description = "The name for this EC2 instances."
  type        = list(string)
}

variable "instance_az" {
  description = "The Availability Zone for this EC2 instance."
  type        = string
  default     = "us-east-1a"
}

variable "instance_vpc_id" {
  description = "The VPC where the instance will be placed."
  type        = string
}

variable "instance_public_key" {
  description = "The Public key for root access to the instance."
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILEwR5cCd9w3xIcdVfOrISCnsdeIW1tPlPAv1bE/z/On rhousand@TD-C02CRBQKMD6N"
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t3.large"
}

variable "subnet_ids" {
  description = "A list of Subnet_ids per instance"
  type        = list(string)
}

variable "instance_nix_release" {
  description = "Nixos repo release version '25.03'"
  type        = string
  default     = "24.05"
}

