# Shared Agent Instructions

These instructions are the shared default for agent-enabled tools in this
dotfiles setup. Treat repo-specific instruction files as higher priority when
they exist.

## Core Standard

- Produce work that is correct, complete, and maintainable.
- Prefer a full fix over a narrow patch when the narrow patch would leave the
  real cause in place.
- Do not ship hacks, bandaids, TODO-driven fixes, or deliberately fragile code
  when a proper fix is reasonably achievable in the current change.
- Favor code that is compact, readable, predictable, and easy to change later.
- Preserve the project's existing architecture and conventions unless they are
  part of the problem.

## How To Approach Work

- Start by understanding the actual problem, not just the visible symptom.
- Read the relevant files and trace the flow before editing.
- Prefer solving root causes over suppressing errors, adding retries, adding
  conditionals, or special-casing outputs.
- If the best fix requires refactoring the touched area, do the refactor.
- Keep refactors purposeful and local to the problem. Do not expand into
  unrelated rewrites without a concrete payoff.
- When multiple layers are involved, fix the right layer instead of masking the
  issue downstream.

## Implementation Standards

- Use the best current, idiomatic practices for the language, framework, and
  library already in use.
- Follow the project's established patterns unless there is a strong technical
  reason to improve them.
- Prefer simple control flow, explicit naming, and clear boundaries between
  responsibilities.
- Remove duplication when it materially improves correctness or maintainability.
- Prefer small, composable functions and modules over sprawling logic.
- Avoid unnecessary abstraction, indirection, or configuration surface area.
- Do not introduce compatibility shims, fallback branches, or defensive code
  that the system does not actually need.
- Keep comments sparse and useful. Code should carry most of the explanation.

## Fix Quality Bar

- Do not stop at making the immediate error disappear. Make the surrounding code
  coherent again.
- If the bug is caused by poor structure, fix the structure.
- If the bug comes from duplicated logic, centralize the logic.
- If the bug comes from unclear state ownership, make ownership explicit.
- If the fix changes behavior, update tests, types, validation, and call sites
  together.
- If a cleaner design eliminates entire categories of mistakes, prefer that
  design over a smaller patch.

## Verification

- Validate changes with the strongest practical checks available, such as tests,
  typechecking, linting, builds, or focused runtime verification.
- Do not claim success without verification when verification is available.
- If a full verification pass is not possible, say what was not run and why.
- Review your own changes for clarity, unnecessary complexity, and accidental
  regressions before finishing.

## Communication

- Be concise, direct, and specific.
- Prefer concrete implementation guidance over abstract advice.
- State important tradeoffs and assumptions clearly.
- If a requested approach would force a poor-quality solution, say so and
  propose the better approach.

## Preferred Defaults

- Prefer root-cause fixes over symptom treatment.
- Prefer explicitness over cleverness.
- Prefer deletion over adding more moving parts.
- Prefer shared logic over copy-pasted logic.
- Prefer modern, standard APIs over legacy patterns.
- Prefer one clean implementation over layered fallbacks.

## Examples

- Good: refactor a duplicated parsing path into one shared function and update
  all callers.
- Bad: patch one caller, leave the duplicate paths inconsistent, and add a TODO.
- Good: replace a brittle state workaround with a clearer ownership model.
- Bad: add another flag, retry, or timeout to hide the underlying flaw.
- Good: modernize touched code to the project's current idioms while fixing the
  bug.
- Bad: preserve an outdated local pattern just because it avoids a slightly
  larger edit.

## Tooling

- Reuse shared commands and shared skills from this dotfiles setup when useful.
- Prefer official documentation for product or API behavior that may have
  changed recently.
- For OpenAI-related work, prefer the OpenAI developer documentation MCP server
  when it is configured; otherwise use official OpenAI documentation.
