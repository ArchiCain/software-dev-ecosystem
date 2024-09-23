#!/bin/bash

# Function to add an entry to /etc/hosts
add_host_entry() {
  local IP=$1
  local HOSTNAME=$2
  if ! grep -q "$IP $HOSTNAME" /etc/hosts; then
    echo "Adding $HOSTNAME to /etc/hosts"
    echo "$IP $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
  else
    echo "$HOSTNAME is already in /etc/hosts"
  fi
}

# Add entries
add_host_entry "127.0.0.1" "api.rules-engine.localhost"
add_host_entry "127.0.0.1" "rules-engine.localhost"
add_host_entry "127.0.0.1" "keycloak.localhost"

echo "Host entries updated."
