{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz") { system = "aarch64-darwin"; } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs  # This points to the latest version of Node.js
    pkgs.yarn
  ];

  # Automatically install the Angular CLI via Yarn in this environment
  shellHook = ''
    if ! command -v ng > /dev/null; then
      yarn global add @angular/cli
    fi
  '';
}
