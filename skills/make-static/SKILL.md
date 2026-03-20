---
name: make-static
description: Runs the project's static checks by executing `make static` from the repository root.
---

# Example Skill

## What I do

I execute the static validation target for this project by running `make static` at the repository root.
This is useful for quickly checking linting, formatting, and other static checks configured in the Makefile.

## How to use me

1. Ensure you are in the project root directory.
2. Run `make static`.
3. Review the output for failures and fix any reported issues.
4. Re-run `make static` until it completes successfully.

## Inputs I expect

- A Makefile in the repository root.
- A `static` target defined in that Makefile.
- Required local dependencies for the target to run.

## Outputs I provide

- Terminal output from the `make static` execution.
- A pass/fail result for static checks.
- Error details to guide fixes when checks fail.

## Good examples

- "Run static checks before I open a PR."
- "Validate lint and formatting for this branch."
- "Execute `make static` and report failures."

## Tips for writing strong skills

- Keep command execution steps explicit and ordered.
- Specify the required working directory.
- Document expected failures and how to recover.
- Include exact command examples where possible.

## Limitations

- This skill assumes `make` is installed.
- Behavior depends on how the `static` target is implemented in the Makefile.
