# 🧪 Environment Setup Guide (Nix + direnv)

## ✅ Step 1: Install Nix

Download and install Nix from the official site:  
🔗 [https://nixos.org/download/](https://nixos.org/download/)

For macOS, run:

```bash
sh <(curl -L https://nixos.org/nix/install)
```

> Once installed, **close your terminal** and open a **new terminal** to ensure the environment is properly refreshed.

---

## ✅ Step 2: Install direnv

Learn more:  
🔗 [https://direnv.net/docs/installation.html](https://direnv.net/docs/installation.html)

For macOS (via Homebrew), run:

```bash
brew install direnv
```

### Add the Shell Hook

Set up the shell hook for direnv.  
For **zsh**, add this to your `~/.zshrc`:

```bash
eval "$(direnv hook zsh)"
```

Then restart your terminal or run:

```bash
source ~/.zshrc
```

---

## ✅ Step 3: Enable direnv in the Project

From your project root, run:

```bash
direnv allow
```

This will allow `direnv` to load the environment defined in the `.envrc` file.

> The `.envrc` contains `use flake`, which automatically starts your terminal in a **Nix flake shell** and activates all the dependencies defined in `flake.nix`.

---

## ✅ Step 4: Open Project Documentation

To view the project docs, run:

```bash
just docs
```

Then **Command-click** the URL shown in the terminal to open the docs in your default browser.