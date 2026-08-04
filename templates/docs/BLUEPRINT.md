# Blueprint

> The plan and shape of the project. Keep this honest — if the plan changes, update it.

## What we're building
<one paragraph: the product and who it's for>

## Discovery decision (go / cautious-go / no-go)
- decision: <go | cautious-go | no-go>
- rationale: <one line: why — worth-doing, competitors, gap, feasibility>
- findings: <link to docs/research/ — the discovery + feasibility notes>

## How it's built (schema)
```
project ──▶ milestones ──▶ features ──▶ requirements ──▶ issues ──▶ PRs ──▶ release
            gates before each release: QA pass + bug hunt + smoke test
```
<replace with a diagram of this project's actual flow / components>

## Stack
- frontend: <…>
- backend: <…>
- mobile: <…>
- infra / devops: <…>

## Milestone roadmap
| Milestone | Goal | Gate / deadline |
|---|---|---|
| Milestone 1 | <…> | <date> |
| MVP | <release 0.1.0 + tag> | <date> |
| Integration, QA & Demo | verification + demo | <date> |
| Tech Debt & Fixes | cleanup (after the gate) | <date> |

## Open decisions
> Decisions intentionally left open. Issue-local ones live as `## Options` in their
> issue and are picked at propose time; cross-cutting ones (shared contracts,
> patterns, dependencies) are decided here or in an ADR before dependent issues start.
- <decision> - options: <A / B> - <local: propose-time | cross-cutting: decide here/ADR>

## Open questions
- <…>
