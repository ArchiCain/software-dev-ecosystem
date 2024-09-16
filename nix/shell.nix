{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs_20        # Install the latest version of NodeJs
    pkgs.yarn             # Yarn for package management
    pkgs.docker           # Docker for containerization
    pkgs.kubectl          # Kubernetes CLI tool
    pkgs.kubernetes-helm  # Helm, a Kubernetes package manager
    pkgs.minikube         # Minikube for running a local Kubernetes cluster
  ];

  # Automatically install the Angular CLI via Yarn in this environment
  shellHook = ''
    # Enable Minikube Ingress if not already enabled
    if ! minikube addons list | grep -q 'ingress: enabled'; then
      minikube addons enable ingress
    fi

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

    # Add Yarn global bin to PATH (for any globally installed packages like ng and nest)
    export PATH="$(yarn global bin):$PATH"
  '';
}
