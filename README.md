# Chauncy Mono

The Chauncy mono is a monorepo made to satiate my technical curiosity and optimize solving my realworld problems. Bonus: alternative solutions for others have similar problems.

<!-- Badges -->
[![Super-Linter](https://github.com/mhutton86/chauncy-mono/actions/workflows/ci.yml/badge.svg)](https://github.com/marketplace/actions/super-linter)

## TODOs

This section captures todos as to avoid missing clean, and well-written, code practices as they come to mind. Then intention is not that these are merged into main, but instead to help pipeline checks remind me if I have any todos that haven't addressed.

* Add basic workflow to work on this project for the first-time versus every-day tasks
* Add documentation for `./setup.sh`
* Add that we have tools set up and why
  * Pre-Commit framework (Deps: Python 3, Pip 3)
  * Generally, it'd be dope to do it in a automata way to have traceability between tools and dependencies, and to find opportunities for pruning tools that are done
* Add overview of `.pre-commit-config.yaml`