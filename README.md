# projectflow

> An issue-driven GitHub workflow.

A disciplined, issue-driven way to build software on GitHub — packaged as an
[Agent Skill](https://agentskills.io) so a coding agent (Claude Code, etc.) can run
it with a human in the loop.

The idea in one line: **requirements become issues, issues are worked one at a time
behind an approval gate, every change is verified by automated tests plus guided manual
checks where human judgment is needed, and the project keeps living docs so context is
never lost.**

> **Recommended companion:** projectflow runs great on its own, but it's designed to
> hand off the *how* of each step to the [superpowers](https://github.com/obra/superpowers)
> skills (TDD, planning, debugging, code review, …). Install those too for the full
> experience — see [Install](#install). Without them, projectflow falls back to its own
> built-in guidance, so nothing breaks.

## The discovery pipeline

New project? Seven phases run before a single issue is opened, each behind its own
approval gate. Full detail in [`docs/DISCOVERY-PIPELINE.md`](docs/DISCOVERY-PIPELINE.md);
the agent prompt for each phase is in [`docs/prompts/`](docs/prompts/).

```
0  Idea & Problem Framing         kill criteria, written before any evidence exists
1  Exhaustive Research            parallel lanes, short or deep, every claim tiered
2  Concept Validation / Red Team  verify the claims, then attack the idea
                                  -> GO / CAUTIOUS-GO / NO-GO
3  Product Charter                the invariants  (a game calls this its design bible)
4  PRD                            every screen and feature, with acceptance criteria
5  Technical Design               cross-cutting decisions, and what is left open
6  Sprint Planning                the backlog -> the loop below takes over
```

Skipped for a bugfix or a small change on an understood system, and the agent says
when it is skipping. A no-go at Phase 2 is a good outcome: it costs days, not months.

## The loop

```
  new / greenfield idea ──▶ discovery pipeline (phases 0-6)
                      │        (skip for small work on an existing system)
                      ▼
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
                     MANUAL steps (only if human judgment needed) ──▶ you confirm
                                                  │
                                                  ▼
                              PR (Closes #N) ──▶ review ──▶ merge
                                                  │
                                                  ▼
                              update PROGRESS.md ──▶ next issue
            (at each milestone close ──▶ "run a bug hunt?")
```

## What you get

- **Discovery-first for new ideas** — a Phase 0 that validates worth-doing,
  competitors, and white space with real research and a **go / cautious-go / no-go**
  before anything is built, then hands the validated idea to `writing-plans`.
- **3-axis labels** — `area:` (your layers) × `priority:` (high/medium/low,
  milestone-relative) × type (`feat`/`bug`/`enhancement`/`documentation`/`testing`).
- **Structured issues** — issue forms that force an engineering-spec body
  (Problem / Wanted / Options / Files / Definition of Done) and apply the right labels.
- **Decisions at the last responsible moment** — issues carry options with trade-offs
  instead of premature picks; the implementer decides at propose time with the code in
  front of them, and cross-cutting calls go to the blueprint or an ADR upfront.
- **Milestones as gates** — numbered iterations + named release gates that double as
  a dashboard (version, tag, deliverables, deadlines).
- **A bug-hunt loop** — keep finding bugs until a dry pass; each becomes a tracked
  `bug` issue, split across milestones by priority. Offered at every milestone close.
- **Living project docs** — `BLUEPRINT.md` (the plan), `ARCHITECTURE.md` (constraints
  & structure), `PROGRESS.md` (a continuously-updated memory of what's been done), and
  `STACK.md` (the tech stack + external providers + env keys + per-provider
  data-residency map).
- **Enforced merge rules** — a `main` ruleset (approval + green checks + no
  force-push) and conventional-commit / PR-title linting.
- **One-shot setup** — a bootstrap script that provisions all of the above in a fresh
  repo.

## Pairs with deep skills (optional)

projectflow handles **what to do and when**. For the **how** of each step it hands off
to deeper single-purpose skills when they're installed — e.g. the
[superpowers](https://github.com/obra/superpowers) set: `brainstorming` to scope work,
`writing-plans`, `test-driven-development`, `systematic-debugging`,
`verification-before-completion`, `requesting-code-review`, and more. Each loop step in
`SKILL.md` is marked with its matching `↳ deep skill`. If those skills aren't
installed, projectflow's own inline guidance takes over — nothing here depends on them.

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

**Recommended — also install superpowers** (the deep skills each step hands off to):

```bash
# Claude Code plugin (auto-updates, adds the session hook)
/plugin install superpowers@claude-plugins-official

# …or copy the skills manually
git clone https://github.com/obra/superpowers /tmp/superpowers
cp -R /tmp/superpowers/skills/* ~/.claude/skills/
```

projectflow detects them automatically — if they're absent it uses its own inline
guidance instead, so this step is optional but recommended.

## Use it on a project

```bash
scripts/bootstrap-repo.sh <owner>/<repo>
```

This creates the label set, the milestones, the issue/PR templates, the `main`
ruleset, a Projects board, and seeds the four living docs + `CLAUDE.md`. It's
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
