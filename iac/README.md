# Deploy Infrastructure Using Tofu (a Open Source Terraform alternative) and Terragrunt

## Step One: Log into AWS cli using SSO

### Set and environment var for with an AWS profile that has rights to deploy VPC and EC2 instances

`export AWS_PROFILE=AdministratorAccess-9876543311`

### Log into AWS using SSO

`aws sso login --profile $AWS_PROFILE`

## Deploy all for the Dev env
