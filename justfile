# Set the default shell to Zsh
set shell := ["zsh", "-c"]

# Show available commands
help:
    @echo "Available commands:"
    @echo "  just env-show              - Show currently loaded environment variables"
    @echo "  just minikube-start        - Start Minikube"
    @echo "  just minikube-stop         - Stop Minikube without deleting"
    @echo "  just minikube-delete       - Delete Minikube cluster"
    @echo "  just docs                  - Start the MkDocs documentation server"

# Show environment variables
env-show:
    @env

# Start Minikube with the default driver (Docker)
minikube-start:
    @echo "🚀 Starting Minikube..."
    @minikube start

# Stop Minikube without deleting the cluster
minikube-stop:
    @echo "🛑 Stopping Minikube (but keeping cluster data)..."
    @minikube stop

# Delete Minikube cluster completely
minikube-delete:
    @echo "🔥 Deleting Minikube cluster..."
    @minikube delete

# Start the MkDocs documentation server
docs:
    @echo "📖 Starting documentation server..."
    @mkdocs serve
