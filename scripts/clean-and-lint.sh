#!/bin/bash -e
# This script will perform checks and cleans

# Determine the root directory of the project based on the script's location
PROJECT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

# Constants for color-coded output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Change to the project root directory
cd "$PROJECT_ROOT"

# Run pre-commit on all files
echo -e "${YELLOW}Running pre-commit hooks on all files...${NC}"
if pre-commit run --all-files --show-diff-on-failure --color always; then
    echo -e "${GREEN}Pre-commit hooks completed successfully.${NC}"
else
    echo -e "${RED}Pre-commit hooks reported errors.${NC}"
    exit 1
fi