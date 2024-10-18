#!/bin/bash

# Exit on any error
set -e

echo "Setting up local development environment..."

# Step 1: Install mkcert (if not already installed)
if ! command -v mkcert &> /dev/null
then
    echo "mkcert could not be found. Installing mkcert..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        brew install mkcert
        brew install nss # Needed for Firefox
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command -v brew &> /dev/null; then
            brew install mkcert
        elif command -v apt &> /dev/null; then
            sudo apt update && sudo apt install libnss3-tools
            wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
            mv mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
            chmod +x /usr/local/bin/mkcert
        else
            echo "Package manager not supported. Please install mkcert manually."
            exit 1
        fi
    else
        echo "Unsupported OS. Please install mkcert manually."
        exit 1
    fi
else
    echo "mkcert is already installed."
fi

# Step 2: Install local CA (if not already installed)
echo "Installing mkcert root CA..."
mkcert -install

# Step 3: Create the ./local-config directory if it doesn't exist
mkdir -p ./local-config

# Step 4: Generate certificates for api.localhost and keycloak.localhost and store them in ./local-config
echo "Generating certificates for api.localhost..."
mkcert -key-file ./local-config/api.localhost-key.pem -cert-file ./local-config/api.localhost.pem api.localhost

echo "Generating certificates for keycloak.localhost..."
mkcert -key-file ./local-config/keycloak.localhost-key.pem -cert-file ./local-config/keycloak.localhost.pem keycloak.localhost

echo "Local environment setup completed successfully!"