#!/bin/bash -e
# run-super-linter.sh: Script to run the super-linter locally on the entire codebase.

# Determine the root directory of the project based on the script's location
PROJECT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

# Constants for color-coded output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Change to the project root directory
cd "$PROJECT_ROOT"

echo -e "${YELLOW}Starting super-linter using Docker...${NC}"

# Run super-linter as a Docker container
docker run \
  -e LOG_LEVEL=DEBUG \
  -e RUN_LOCAL=true \
  -e DEFAULT_BRANCH=main \
  -v "${PROJECT_ROOT}:/tmp/lint" \
  ghcr.io/super-linter/super-linter:v7

# Check the exit status of the Docker command
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Super-linter completed successfully.${NC}"
else
  echo -e "${RED}Super-linter reported errors.${NC}"
  exit 1
fi
