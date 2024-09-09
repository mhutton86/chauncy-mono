# Chauncy Mono

The Chauncy mono is a monorepo made to satiate my technical curiosity and optimize solving my realworld problems. Bonus: alternative solutions for others have similar problems.

<!-- Badges -->

[![Super-Linter](https://github.com/mhutton86/chauncy-mono/actions/workflows/ci.yml/badge.svg)](https://github.com/mhutton86/chauncy-mono/actions/workflows/ci.yml)
[![Super-Linter](https://github.com/mhutton86/chauncy-mono/actions/workflows/lint.yml/badge.svg)](https://github.com/mhutton86/chauncy-mono/actions/workflows/lint.yml)

## General Workflow

This section provides the general workflow of using this repository.

1. [Set up developement-environment-as-code](#set-up-developement-environment-as-code)
1. Perform code cleanup and linting

## Workflows

The sections covers the available workflows. This section is organized in the order the workflows should typically be run; Although, is to be used as a reference in the order that facilitates developer's needs.

### Set up developement-environment-as-code

This step sets up the necessary development dependencies and tools required for the project. It ensures that your environment is configured correctly and consistently across different setups. Additionally, it sets up pre-commit hooks to automatically check for code quality issues before commits, helping maintain code standards and reducing errors.

```shell
./scripts/setup-env.shscripts/setup-env.sh
```

## Configuration

<!-- Todo I want to do a simple and elegant job of breaking down how this project is configured. For the purposes of it understandable, maintainable, and to encourage the expectations of keeping it up-to-date -->

There are multiple aspects to the configuration of this project

DevOps

- Development
- Code quality and static analysis
- Production
