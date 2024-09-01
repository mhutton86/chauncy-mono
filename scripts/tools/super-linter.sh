#!/bin/bash -e
# super-linter.sh: Script to run the super-linter locally on the entire codebase.
#
# Note: Despite Yaml prettier, bashfmt, and other mentioned prettifier tools. They are used only for linting purposes. As its name indicates, Super-Linter focuses on linting only. Formatting is intentionally supposed to be a separate sctivity.

# Directories to simplify making script runnable from anywhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(cd "${SCRIPT_DIR}/../.." && pwd)

# Source the common functions and constants
source "${SCRIPT_DIR}/../.common.sh"

# Run super-linter as a Docker container. Success checked upon return.
echo_yellow "Running super-linter using Docker..."

# Custom entrypoint command explanation:
# The custom entrypoint command `/bin/sh -c "/action/lib/linter.sh; chown -R $(id -u):$(id -g) ${WORK_DIR}"` does the following:
# 1. It first runs the default linter script (`/action/lib/linter.sh`), which lints and potentially fixes the codebase.
# 2. Regardless of whether the linter script succeeds or fails, it then runs `chown -R $(id -u):$(id -g) ${WORK_DIR}`.
#    This command changes the ownership of all files in the mounted workspace directory back to the user who invoked the Docker command.
#    This step is necessary because Docker containers typically run as root by default, which can result in files being owned by root on the host system.
#    Running `chown` ensures that file ownership is corrected, preventing permission issues when working with these files outside of Docker.

WORK_DIR="/tmp/lint" # Directory to mount as workspace inside super-linter container
if docker run \
  --rm \
  --env-file "${PROJECT_ROOT}/.super-linter-format-cfg.env" \
  -e RUN_LOCAL=true \
  -e DEFAULT_WORKSPACE="${WORK_DIR}" \
  -e DEFAULT_BRANCH=main \
  -v "${PROJECT_ROOT}:${WORK_DIR}" \
  --entrypoint /bin/sh \
  ghcr.io/super-linter/super-linter:v7 \
  -c "/action/lib/linter.sh && chown -R $(id -u):$(id -g) ${WORK_DIR}"; then
  echo_green "Super-linter completed successfully."
else
  echo_red "Super-linter reported errors."
  exit 1
fi
