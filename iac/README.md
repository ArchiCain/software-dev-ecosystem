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

## Add EC2 instances to TailScale

### Create a TailScale Auth Key

https://login.tailscale.com/admin/settings/keys

- Select Reusable
- Set Expiration for key to 1 day
- Set Tags for the host [ k3s-dev ]
- Copy the tskey-auth to use in the next steps

### Deploy Tailscale (follow these steps on each k3s EC2 instance)

- Use AWS SSM to access each instance
- Sudo to root

```
sudo -i
```

- Create a ssh key for to allow read only access to Bitbucket

```
ssh-keygen -t ed25519 -a 32
```

- Copy the newly generated public key to your clipboard
- Add the public key to the Bitbucket nix-flake-tailscale repo
  https://bitbucket.org/scain-td/nixos-flake-tailscale/admin/access-keys/
- Install git using nix-shell

```
nix-shell -p git
```

- Clone the nixos-flake-tailscale repo

```
git clone git@bitbucket.org:scain-td/nixos-flake-tailscale.git
exit # This exits the nix-shell making git nolonger avalible
```

- Copy configuration.nix from repo to /etc/nixos

```
cp nixos-flake-tailscale/configuration.nix /etc/nixos
```

- Remove "unstable.tailscale" from /etc/nixos/configuration.nix

```
sed -i '/unstable.tailscale/d' /etc/nixos/configuration.nix
```

- Deploy configuration.nix

```
nix-channel --update
nixos-rebuild switch
reboot # Reboot is not required but it will get you running the latest kernal
```

- Export the Tailscale auth key copied eariler

```
export TS_AUTH_KEY="PLACE_YOUR_KEY_HERE"
```

- Install Tailscale (This flake is impure because we are using and enviroment variable to alter the flake.)

```
cd ~/nixos-flake-tailscale
nixos-rebuild switch --flake .#tsNode --impure
```

- Exit SSM session to the EC2 instance

- Access the Machines tab in Tailscale management console to sign the locked out host

# Deploy K3s

[Deploy K3s README]
(../kubernetes/k3s/README.md)
