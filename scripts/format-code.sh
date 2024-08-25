#!/bin/bash -e
# format-code.sh: Script to cleanup code against formatting rules and tools

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(cd "${SCRIPT_DIR}/.." && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/.common.sh"

# Run shfmt tool. Used for formatting shell scripts. Leverages .editorconfig
echo_yellow "Running 'shfmt' tool..."
if pre-commit run --all-files --show-diff-on-failure --color always; then
  echo_green "Pre-commit hooks completed successfully."
else
  echo_red "Pre-commit hooks reported errors."
  exit 1
fi
