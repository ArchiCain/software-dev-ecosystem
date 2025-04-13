# 🧪 Environment Overview

This project uses **Nix Flakes** and a consistent developer environment to ensure all tools, CLIs, and dependencies are reproducible and cross-platform.

---

## 📦 Core Tools

The following tools are installed automatically via the Nix development shell and are available to you whenever you enter the environment using `direnv` or `nix develop`.

### 🔧 System & Shell Tools

- **nix**  
  Reproducible package manager that builds the development shell. It ensures everyone is using the same version of tools with no side effects or system pollution.

- **direnv**  
  Automatically loads and unloads environment variables defined in `.envrc` when you enter/leave the project directory. Enables `use flake` to auto-start the Nix shell.

- **just**  
  A task runner that acts like a modern Makefile. It lets you define and run named commands for tasks like starting Minikube, running tests, launching docs, etc.

- **envsubst**  
  A lightweight tool used to substitute environment variables into files (e.g., templates). Useful for generating config files with secrets or environment-specific values.

---

## 🛠️ How It Works

- The `flake.nix` file defines a reproducible development shell.
- The `.envrc` file runs `use flake` to activate that shell automatically.
- `direnv` ensures the shell is loaded when entering the repo.

---

## 📁 Directory Structure

Overview of important files:

- `flake.nix` — Defines the dev shell and dependencies
- `.envrc` — Tells `direnv` to use the flake
- `justfile` — Task automation
- `projects/` — Where external repos can be cloned
- `docs/` — MkDocs documentation site