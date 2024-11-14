# Software Dev Ecosystem

## Overview

This project is designed to provide a scalable and reproducible development environment using [Nix](https://nixos.org/). All dependencies are managed through Nix to ensure consistency across different systems.

### Technologies Used
- **Nix**: To manage and reproduce development environments
- **Homebrew**: MacOS package manager
- **Direnv**: To startup terminals with Nix
- **Yarn**: For Typescript/Javascript package management
- **NX Workspace**: A monorepo for Typescript/JavaScript development

## Setting Up the Development Environment

To set up the environment, follow these steps:

**Brand new Mac needs XCode installed and agreements accepted**
**Setup git username and email**

1. **TODO: document Nix installation**
2. **TODO: document installation of direnv and running direnv allow**
3. **TODO: document docker desktop and enabling k8s**
4. **TODO: document NX workspace and plugin setup**

**Running K8's:**

Update etc/host file with the following addresses:
```
127.0.0.1       web-app-1.localhost
127.0.0.1       web-app-2.localhost
127.0.0.1       keycloak.localhost
127.0.0.1       api.localhost
```

Run these commands:
```
task kubernetes:nginx-ingress-install
task kubernetes:setup-local-cert
task kubernetes:tilt:up
```