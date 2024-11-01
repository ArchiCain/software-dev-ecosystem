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
            liquibase # Add Liquibase for database migrations
          ];
          shellHook = ''
            # Ensure Nx CLI is installed
            if ! command -v nx > /dev/null; then
              echo "Nx CLI not found. Installing globally via Yarn..."
              yarn global add nx
            else
              echo "Nx CLI is already installed."
            fi

            # Add Yarn global bin to PATH (for globally installed packages like nx)
            export PATH="$(yarn global bin):$PATH"
          '';
        };
      });
}
