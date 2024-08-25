#!/bin/bash -e
# scripts/format-code.sh: Script to cleanup code against formatting rules and tools

# Constants for color-coded output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# General function to echo messages with specified color
echo_color() {
  local color="$1"
  local message="$2"
  echo -e "${color}${message}${NC}"
}

# Print messages in green (typically for success).
echo_green() {
  echo_color "$GREEN" "$1"
}

# Print messages in yellow (typically for warnings).
echo_yellow() {
  echo_color "$YELLOW" "$1"
}

# Print messages in red (typically for errors).
echo_red() {
  echo_color "$RED" "$1"
}