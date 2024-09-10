{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs  # Install the latest version of NodeJs
    pkgs.yarn
  ];

  # Automatically install the Angular CLI via Yarn in this environment
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

    # Add Yarn global bin to PATH (for any globally installed packages like ng and nest)
    export PATH="$(yarn global bin):$PATH"
  '';
}
