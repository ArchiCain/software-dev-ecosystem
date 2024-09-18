{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [
            nodejs_20 # Install the latest version of NodeJs
            yarn # Yarn for package management
            docker # Docker for containerization
            kubectl # Kubernetes CLI tool
            kubernetes-helm # Helm, a Kubernetes package manager
            terraform # Infrustructure-as-Code (IaC) tool
            go-task # Task for common commands
            tilt # Add Tilt for Kubernetes dev workflow
            deploy-rs # Tool used to deploy Flakes to Nixos remote hosts
          ];
          shellHook = ''
            # Ensure Angular CLI is installed
            if ! command -v ng > /dev/null; then
              yarn global add @angular/cli
            else
              echo "Angular CLI is already installed."
            fi

            # Ensure NestJS CLI is installed
            if ! command -v nest > /dev/null; then
              echo "NestJS CLI not found. Installing globally via Yarn..."
              yarn global add @nestjs/cli
            else
              echo "NestJS CLI is already installed."
            fi

            # Add Yarn global bin to PATH (for globally installed packages like ng and nest)
            export PATH="$(yarn global bin):$PATH"
          '';
        };
      });
}
