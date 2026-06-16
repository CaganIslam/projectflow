# projectflow

> An issue-driven GitHub workflow.

A disciplined, issue-driven way to build software on GitHub — packaged as an
[Agent Skill](https://agentskills.io) so a coding agent (Claude Code, etc.) can run
it with a human in the loop.

The idea in one line: **requirements become issues, issues are worked one at a time
behind an approval gate, every change is verified by automation _and_ a guided manual
pass, and the project keeps living docs so context is never lost.**

## The loop

```
  requirements ──▶ issues (labeled + milestoned)
                      │
                      ▼
           show backlog + priority ──▶ you steer
                      │
                      ▼
   pick one issue ──▶ PROPOSE approach ──▶ [you approve] ──▶ implement
                                                  │
                                                  ▼
                                   verify: automated tests
                                                  │
                                                  ▼
                                   MANUAL test steps ──▶ you confirm
                                                  │
                                                  ▼
                              PR (Closes #N) ──▶ review ──▶ merge
                                                  │
                                                  ▼
                              update PROGRESS.md ──▶ next issue
            (at each milestone close ──▶ "run a bug hunt?")
```

## What you get

- **3-axis labels** — `area:` (your layers) × `priority:` (high/medium/low,
  milestone-relative) × type (`feat`/`bug`/`enhancement`/`documentation`/`testing`).
- **Structured issues** — issue forms that force an engineering-spec body
  (Problem / Wanted / Fix / Files / Definition of Done) and apply the right labels.
- **Milestones as gates** — numbered iterations + named release gates that double as
  a dashboard (version, tag, deliverables, deadlines).
- **A bug-hunt loop** — keep finding bugs until a dry pass; each becomes a tracked
  `bug` issue, split across milestones by priority. Offered at every milestone close.
- **Living project docs** — `BLUEPRINT.md` (the plan), `ARCHITECTURE.md` (constraints
  & structure), `PROGRESS.md` (a continuously-updated memory of what's been done).
- **Enforced merge rules** — a `main` ruleset (approval + green checks + no
  force-push) and conventional-commit / PR-title linting.
- **One-shot setup** — a bootstrap script that provisions all of the above in a fresh
  repo.

## Install

Copy the skill into your agent's skills directory:

```bash
# Claude Code (personal)
git clone https://github.com/CaganIslam/projectflow \
  ~/.claude/skills/projectflow
```

Then invoke it (`/projectflow`) or let it trigger on phrases like
"let's plan this feature", "break this into issues", "run a bug hunt", "set up the
repo".

## Use it on a project

```bash
scripts/bootstrap-repo.sh <owner>/<repo>
```

This creates the label set, the milestones, the issue/PR templates, the `main`
ruleset, a Projects board, and seeds the three living docs + `CLAUDE.md`. It's
idempotent — safe to re-run to reconcile an existing repo.

## Configure

Set these once per project (the bootstrap asks; `CLAUDE.md` records them):

- **areas** — your layer vocabulary (`frontend, backend, mobile, devops`, or
  `api, web, infra`, …). Drives labels, title prefixes, and branch/commit scopes.
- **milestone scheme**, **test commands**, and the **traceability** system issues
  map back to.

## Layout

```
SKILL.md                    the method (read this first)
CLAUDE.md                   drop-in project memory
commitlint.config.js        commit/PR-title grammar (set your areas)
scripts/bootstrap-repo.sh   one-shot repo setup
templates/.github/          issue forms, PR template, branch ruleset
templates/docs/             living-doc + ADR seeds
docs/adr/                   this repo's own decision records
```

## License

MIT © CaganIslam
