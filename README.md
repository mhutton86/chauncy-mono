# Chauncy Mono

The Chauncy mono is a monorepo made to satiate my technical curiosity and optimize solving my realworld problems. Bonus: alternative solutions for others have similar problems.

<!-- Badges -->

[![Super-Linter](https://github.com/mhutton86/chauncy-mono/actions/workflows/ci.yml/badge.svg)](https://github.com/mhutton86/chauncy-mono/actions/workflows/ci.yml)
[![Super-Linter](https://github.com/mhutton86/chauncy-mono/actions/workflows/lint.yml/badge.svg)](https://github.com/mhutton86/chauncy-mono/actions/workflows/lint.yml)

## General Workflow

This section provides the general workflow of using this repository.

1. [Set up developement-environment-as-code](#set-up-developement-environment-as-code)
1. [Perform code cleanup and linting](#perform-code-cleanup-and-linting)

## Workflows

The sections covers the available workflows. This section is organized in the order the workflows should typically be run; Although, is to be used as a reference in the order that facilitates developer's needs.

### Set up developement-environment-as-code

This step sets up the necessary development dependencies and tools required for the project. It ensures that your environment is configured correctly and consistently across different setups. Additionally, it sets up pre-commit hooks to automatically check for code quality issues before commits, helping maintain code standards and reducing errors.

```bash
./scripts/setup-env.sh
```

### Perform code cleanup and linting

This step runs the linter script to check and clean up code formatting and linting issues across the codebase. It uses the pre-commit framework and Super-Linter to ensure code quality.

```bash
./scripts/clean-and-lint.sh
```

## Configuration

There are multiple aspects to this project's configuration:

### DevOps

Code quality and static analysis

- Performed by:
  - **Super-Linter**: A bundling of linting and formatting tools.
  - Related configuration-as-code files:
    - `.super-linter-format-cfg.env`: Contains settings for autofixing code formatting issues.
    - `.super-linter-lint-cfg.env`: Contains settings for linter rules and configurations.
    - `.yaml-lint.yml`: Contains rules for linting YAML files.
    - `.editorconfig`: Defines coding styles for different file types.
  - **Pre-commit framework**: Ensures code quality checks before commits.
  - Configuration file:
    - `.pre-commit-config.yaml`: Defines the hooks and checks to run before commits.
