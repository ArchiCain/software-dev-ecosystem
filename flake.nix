{
  description = "Monorepo Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        ## Core utilities
        nix
        direnv
        just
        git

        ## Kubernetes & Infrastructure
        kubectl
        minikube
        terraform
        helm

        ## Documentation & Scaffolding
        mkdocs
        hygen
        jq
        envsubst
      ];

      shellHook = ''
        # Load environment variables
        export ENV=${ENV:-dev}
        if [ -f .env.$ENV ]; then
          export $(grep -v '^#' .env.$ENV | xargs)
          echo "Loaded .env.$ENV"
        else
          echo "Warning: .env.$ENV not found, using default .env"
          export $(grep -v '^#' .env | xargs)
        fi

        echo "🚀 Monorepo Dev Shell (ENV=$ENV)"
        echo "💡 Use 'just help' to see available commands."
      '';
    };
  };
}
