#!/bin/bash -e
# super-linter.sh: Script to run the super-linter locally on the entire codebase.
#
# Note: Despite Yaml prettier, bashfmt, and other mentioned prettifier tools. They are used only for linting purposes. As its name indicates, Super-Linter focuses on linting only. Formatting is intentionally supposed to be a separate sctivity.

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(cd "${SCRIPT_DIR}/../.." && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/../.common.sh"

echo_yellow "Running super-linter using Docker..."

# Run super-linter as a Docker container

# Check whether super-linter succeeded or failed.
if docker run \
  --rm \
  -e RUN_LOCAL=true \
  -e DEFAULT_WORKSPACE=/tmp/lint \
  -e DEFAULT_BRANCH=main \
  -e FIX_SHELL_SHFMT=true \
  -e FIX_JSON_PRETTIER=true \
  -e FIX_GOOGLE_JAVA_FORMAT=true \
  -e FIX_MARKDOWN_PRETTIER=true \
  -e FIX_POWERSHELL=true \
  -e FIX_YAML_PRETTIER=true \
  -e FIX_MARKDOWN_PRETTIER=true \
  -v "${PROJECT_ROOT}:/tmp/lint" \
  ghcr.io/super-linter/super-linter:v7; then

  # TODO deduplicate ownership logic with a common function
  # sudo chown -R "$(id -u):$(id -g)" "${PROJECT_ROOT}"
  echo_green "Super-linter completed successfully."
else
  # sudo chown -R "$(id -u):$(id -g)" "${PROJECT_ROOT}"
  echo_red "Super-linter reported errors."
  exit 1
fi
