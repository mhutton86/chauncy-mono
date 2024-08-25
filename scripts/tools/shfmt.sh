#!/bin/bash -e
# shfmt.sh: Script to run the shfmt locally on the entire codebase. shfmt is used to format BASH scripts

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(cd "${SCRIPT_DIR}/../.." && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/../.common.sh"

echo_yellow "Running shfmt using Docker..."

docker run \
  --rm -u "$(id -u):$(id -g)" \
  -v "${PROJECT_ROOT}:/mnt" -w /mnt \
  mvdan/shfmt:v3-alpine -w /mnt

# Check whether shfmt succeeded.
if [ $? -ne 0 ]; then
  echo_red "shfmt reported errors."
  exit 1
fi

echo_green "shfmt completed successfully."
