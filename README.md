# 🧪 Developer Environment Setup (Nix + direnv)

This project uses a reproducible environment powered by **Nix Flakes**. Once installed, you'll have access to all required tools for local development and Kubernetes workflows.

---

## ✅ Step 1: Install Nix

Install Nix from the official site:  
🔗 https://nixos.org/download/

For macOS:

    sh <(curl -L https://nixos.org/nix/install)

> After install, **restart your terminal**.

---

## ✅ Step 2: Install `direnv`

🔗 https://direnv.net/docs/installation.html

    brew install direnv

Then add the shell hook:

### For Zsh (macOS default)

    echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
    source ~/.zshrc

---

## ✅ Step 3: Enable the Dev Shell

From the project root:

    direnv allow

This will activate the Nix environment via the `.envrc` file.

---

## ✅ Step 4: View the Full Project Documentation

To view the full docs (powered by **MkDocs**):

    just docs

> This will start the documentation server and print a URL like:  
> `http://127.0.0.1:8000/`

Click the link or open it in your browser to view full docs.

---

## 🧭 Next Steps

After opening the docs, follow setup guides for:

- Kubernetes (Minikube, Lens, kubectl, Helm)
- Project directory layout and conventions
- Running services with Tilt
- Code generation tools
- Database setup and migrations