#!/bin/bash -e
# super-linter.sh: Script to run the super-linter locally on the entire codebase.
#
# Note: Despite Yaml prettier, bashfmt, and other mentioned prettifier tools. They are used only for linting purposes. As its name indicates, Super-Linter focuses on linting only. Formatting is intentionally supposed to be a separate sctivity.

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(cd "${SCRIPT_DIR}/.." && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/../.common.sh"

echo_yellow "Running super-linter using Docker..."

# Run super-linter as a Docker container
docker run \
  -e RUN_LOCAL=true \
  -e DEFAULT_BRANCH=main \
  -v "${PROJECT_ROOT}:/tmp/lint" \
  ghcr.io/super-linter/super-linter:v7

# Check whether super-linter succeeded or failed.
if [ $? -eq 0 ]; then
  echo_green "Super-linter completed successfully."
else
  echo_red "Super-linter reported errors."
  exit 1
fi
