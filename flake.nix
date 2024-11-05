{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgsStable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [
            docker # Docker for containerization
            go-task # Task for common commands
            kubectl # Kubernetes CLI tool
            kubernetes-helm # Helm, a Kubernetes package manager
            liquibase # Add Liquibase for database migrations
            localstack # Fully functional local Cloud stack
            nodejs_20 # Install the latest version of NodeJs
            terraform # Infrustructure-as-Code (IaC) tool
            tilt # Add Tilt for Kubernetes dev workflow
            yarn # Yarn for package management
          ];
          shellHook = ''
            # Ensure Nx CLI is installed
            if ! command -v nx > /dev/null; then
              echo "Nx CLI not found. Installing globally via Yarn..."
              yarn global add nx
            else
              echo "Nx CLI is already installed."
            fi

            # Ensure Docker daemon is running
            if ! command docker ps > /dev/null; then
              echo "Docker daemon it not running; starting docker desktop"
              open /Applications/Docker.app
              sleep 15
            else 
              echo "Docker daemon is up and running"
            fi

            # Ensure localstack has been started
            if ! command localstack status services > /dev/null; then
              echo "Starting localstack"
              localstack start -d
            else
              echo "localstack is up and running"
            fi

            # Add Yarn global bin to PATH (for globally installed packages like nx)
            export PATH="$(yarn global bin):$PATH"
          '';
        };
      });
}
