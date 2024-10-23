# Deploy Infrastructure Using Tofu (a Open Source Terraform alternative) and Terragrunt

## Step One: Log into AWS cli using SSO

### Set and environment var for with an AWS profile that has rights to deploy VPC and EC2 instances

`export AWS_PROFILE=AdministratorAccess-9876543311`

### Log into AWS using SSO

`aws sso login --profile $AWS_PROFILE`

## Deploy Dev Including VPC, Subnets, and EC2 instances

### Change to the Dev Directory

`cd terragrunt/infrastructure/dev/`

### View what Terragrunt will deploy for all configurations

`terragrunt run-all plan`

### Apply all Terrgrunt configurations

`terragrunt run-all apply`
