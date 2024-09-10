# Software Dev Ecosystem

## Overview

This project is designed to provide a scalable and reproducible development environment using [Nix](https://nixos.org/). All dependencies are managed through Nix to ensure consistency across different systems.

### Technologies Used
- **Nix**: To manage and reproduce development environments.
- **Node.js**: For both the frontend and backend services.
- **Yarn**: For package management.
- **Angular**: Frontend framework.
- **NestJS**: Backend framework.

## Setting Up the Development Environment

To set up the environment, follow these steps:

1. **Enter the Nix environment**:

   The `shell.nix` file is located in the `nix/` directory. Navigate to that directory and run `nix-shell` to activate the environment:

   ```bash
   cd nix
   nix-shell
   ```

   This will load all required dependencies for the project, such as Node.js, Yarn, and Angular CLI.
