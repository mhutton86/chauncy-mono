#!/bin/bash -e
# This script sets up development dependencies for the project.
#
# Assumptions:
#   - Ubuntu 22.04+
#
# Installs:
#   - Pre-Commit framework (deps: Python, pip)

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/.common.sh"

echo_green "Starting setup of development dependencies..."

# Update and upgrade system packages
echo_yellow "Updating system packages..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Pre-Commit framework
## Install the framework
echo_yellow "Installing Pre-Commit framework..."
sudo apt-get install -y \
  pre-commit \  # Pre-Commit framework
shfmt           # shfmt: shell formatting

## Check if installation took
if ! command -v pre-commit &>/dev/null; then
  echo_red "Pre-Commit installation failed."
  exit 1
fi

## Install Pre-Commit Git hooks
pre-commit install

# Success! Display helpful & relevant information for the developer if needed
echo_green "Setup complete!"
echo_green "  - Note: Pre-Commit will now manage Git hooks."
