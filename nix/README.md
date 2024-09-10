# Nix Environment Setup

This directory contains the Nix configuration for setting up a reproducible development environment. The `shell.nix` file defines all the dependencies and tools required for the project.

## Overview

The `shell.nix` file in this directory is used to create a consistent development environment across all machines. By running `nix-shell`, Nix will automatically install all necessary dependencies, such as:

- **Node.js**: Used for both frontend (Angular) and backend (NestJS) development.
- **Yarn**: A package manager for JavaScript that is used to install dependencies and manage the project.
- **Angular CLI**: A command-line tool for managing Angular projects.

## Contents

- **`shell.nix`**: Defines the dependencies and tools required for the development environment.

## Using the Nix Environment

To set up the environment, navigate to this `nix` directory and run `nix-shell`:

```bash
cd nix
nix-shell
```


This command will load the Nix environment based on the `shell.nix` file, ensuring all required dependencies are available.

### Important Notes

- **Temporary Environment**: The Nix environment is temporary and only active for the current terminal session. You will need to run `nix-shell` each time you open a new terminal session.
- **Managing Dependencies**: All dependencies (Node.js, Yarn, Angular CLI, etc.) are managed through Nix, so there's no need to install them globally on your system.

For more information about Nix, you can refer to the [official Nix documentation](https://nixos.org/manual/nix/stable/).