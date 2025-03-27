Explain the monorepo and the tools used:

nix
direnv  # Automatically loads environment variables from `.envrc`
just    # Task runner for defining and executing common commands
yarn    # Preferred package manager over npm for managing JavaScript dependencies
envsubst  # CLI tool for substituting environment variables in files

## === DATABASE MIGRATIONS === ##
liquibase  # Database migration tool (used for schema versioning)

## === KUBERNETES & INFRASTRUCTURE === ##
kubectl  # CLI tool to interact with Kubernetes clusters
helm  # Helm package manager for deploying applications in Kubernetes
minikube  # Local Kubernetes cluster for development/testing
terraform  # Infrastructure as Code (IaC) tool for managing cloud infrastructure
docker  # Container runtime for running and managing Docker containers

## === DOCUMENTATION === ##
mkdocs  # Static site generator for project documentation