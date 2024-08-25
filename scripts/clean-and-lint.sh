#!/bin/bash -e
# clean-and-lint.sh: This script will perform checks and cleans against the entire codebase. Checks are first, to minimize linting catches.

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/.common.sh"

# Run pre-commit on all files
echo_yellow "Running pre-commit hooks on all files..."
if pre-commit run --all-files --show-diff-on-failure --color always; then
    echo_green "Pre-commit hooks completed successfully."
else
    echo_red "Pre-commit hooks reported errors."
    exit 1
fi
