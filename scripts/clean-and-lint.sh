#!/bin/bash -e
# lint-all.sh: This script will lint the entire codebase for code, scripts, data file, docker, and documentation issues. Checks are first, to minimize linting catches.

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/.common.sh"

# Run pre-commit linting
# Note: Update .pre-commit-config.yaml for additional linting needs to retain a one-stop shop
echo_yellow "Running pre-commit checks..."
if pre-commit run --all-files --show-diff-on-failure --color always; then
  echo_green "Pre-commit completed successfully."
else
  echo_red "Pre-commit reported errors."
  exit 1
fi
