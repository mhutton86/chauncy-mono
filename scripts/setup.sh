#!/bin/bash -e
# This script sets up development dependencies for the project.
#
# Assumptions:
#   - Ubuntu 22.04+
#
# Installs:
#   - Pre-Commit framework (deps: Python, pip)

# Constants for color-coded output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting setup of development dependencies...${NC}"

# Update and upgrade system packages
echo -e "${YELLOW}Updating system packages...${NC}"
sudo apt-get update -y && sudo apt-get upgrade -y

# Install Pre-Commit framework
echo -e "${YELLOW}Installing Pre-Commit framework...${NC}"
sudo apt-get install -y pre-commit

# Check Pre-Commit installation
if ! command -v pre-commit &> /dev/null; then
    echo -e "${RED}Pre-Commit installation failed.${NC}"
    exit 1
fi

# Optional: Display next steps or information about configuration
echo -e "${GREEN}Setup complete. You can now use Pre-Commit for managing Git hooks.${NC}"
echo -e "${GREEN}Run 'pre-commit run --all-files' to check the entire codebase.${NC}"
