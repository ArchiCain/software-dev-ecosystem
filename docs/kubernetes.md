# ☸️ Kubernetes Setup (Minikube)

This project uses **Minikube** to run a local Kubernetes cluster for development and testing, managed using `just` commands for consistency and ease of use.

---

## ✅ Prerequisites

- **Docker Desktop** must be running in the background
- **Lens** must be installed (see below)
- Kubernetes tooling (`kubectl`, `minikube`, `helm`) is provided via the Nix environment

---

## 🚀 Starting and Stopping Minikube

Use the following `just` commands to manage your local Kubernetes cluster:

### Start Minikube

    just minikube-start

This will start the cluster using the Docker driver.

### Stop Minikube

    just minikube-stop

Stops the cluster but preserves the data.

### Delete Minikube

    just minikube-delete

Deletes the Minikube cluster completely (used when resetting the environment).

---

## 👁️ Required: Lens Kubernetes Dashboard

This project recommends using [**Lens**](https://k8slens.dev) as the Kubernetes dashboard.

> Lens provides a full-featured visual UI for exploring your cluster, inspecting logs, and managing workloads.

### Install Lens on macOS

Use Homebrew:

    brew install --cask lens

Or download from the website:  
🔗 https://k8slens.dev

### Launch Lens

From the repo root:

    just lens

Or open it manually via Spotlight or Applications.

> Once Minikube is running, Lens will auto-detect the cluster from your `~/.kube/config`.

---

## 📦 Kubernetes Tools Included in This Environment

These tools are available in the dev shell (via Nix):

- `kubectl` — Kubernetes CLI
- `minikube` — Local Kubernetes cluster manager
- `helm` — Kubernetes package manager

You can use them manually as needed:

    kubectl get pods
    helm list

But prefer `just` commands when available to maintain consistency across team workflows.