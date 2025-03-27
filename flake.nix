{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";  # Use the latest unstable Nix packages
    flake-utils.url = "github:numtide/flake-utils";  # Utility functions for easier flake setup
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;  # Allow unfree (proprietary) packages if needed
      };
    in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [

            ## === CORE UTILITIES === ##
            direnv  # Automatically loads environment variables from `.envrc`
            just    # Task runner for defining and executing common commands
            nodejs_20  # Provides Node.js 20 for running JavaScript/TypeScript projects
            yarn    # Preferred package manager over npm for managing JavaScript dependencies
            envsubst  # CLI tool for substituting environment variables in files
            
            ## === DATABASE MIGRATIONS === ##
            liquibase  # Database migration tool (used for schema versioning)

            ## === KUBERNETES & INFRASTRUCTURE === ##
            kubectl  # CLI tool to interact with Kubernetes clusters
            kubernetes-helm  # Helm package manager for deploying applications in Kubernetes
            minikube  # Local Kubernetes cluster for development/testing
            terraform  # Infrastructure as Code (IaC) tool for managing cloud infrastructure
            docker  # Container runtime for running and managing Docker containers

            ## === DOCUMENTATION === ##
            mkdocs  # Static site generator for project documentation
            python3Packages.mkdocs-material  # MkDocs Material theme
          ];

          shellHook = ''
            # Set Minikube default driver to Docker
            minikube config set driver docker

            # TODO: add yarn audit
            yarn
          '';
        };
      });
}
