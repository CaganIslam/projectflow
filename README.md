# projectflow

> A discovery pipeline and an issue-driven GitHub workflow.

A disciplined way to take an idea from "should we build this at all" to shipped work,
packaged as an [Agent Skill](https://agentskills.io) so a coding agent (Claude Code,
etc.) can run it with a human in the loop.

Two halves. **In front:** a seven-phase discovery pipeline that researches the idea,
red-teams it, and produces a **go / cautious-go / no-go** before anything is built.
**Behind it:** requirements become issues, issues are worked one at a time behind an
approval gate, every change is verified with evidence, and living docs keep the
context.

A no-go at phase 2 is a good outcome. It costs days instead of months.

> **Recommended companion:** projectflow runs great on its own, but it's designed to
> hand off the *how* of each step to the [superpowers](https://github.com/obra/superpowers)
> skills (TDD, planning, debugging, code review, …). Install those too for the full
> experience - see [Install](#install). Without them, projectflow falls back to its own
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

- **A discovery pipeline for new ideas** - seven phases, each behind its own approval
  gate, from framing through research and a red-team verdict to a backlog. See above.
- **Gates that actually fire** - the two rules most often skipped (propose before you
  work, evidence before you claim "done") are always-on with observable triggers: no
  edit before an approved proposal, no "done" without the output in the same message.
- **3-axis labels** - `area:` (your layers) × `priority:` (high/medium/low,
  milestone-relative) × type (`feat`/`bug`/`enhancement`/`documentation`/`testing`).
- **Structured issues** - issue forms that force an engineering-spec body
  (Problem / Wanted / Options / Files / Definition of Done) and apply the right labels.
- **Decisions at the last responsible moment** - issues carry options with trade-offs
  instead of premature picks; the implementer decides at propose time with the code in
  front of them, and cross-cutting calls go to the blueprint or an ADR upfront.
- **Milestones as gates** - numbered iterations + named release gates that double as
  a dashboard (version, tag, deliverables). Ordered by dependency; no calendar
  estimates anywhere.
- **An agent never checks its own work** - whatever catches errors in a previous step
  (review, verification, QA, bug hunt) is done by a fresh agent that didn't produce it.
- **A bug-hunt loop** - keep finding bugs until a dry pass; each becomes a tracked
  `bug` issue, split across milestones by priority. Offered at every milestone close.
- **Living project docs** - `BLUEPRINT.md` (the plan), `ARCHITECTURE.md` (constraints
  & structure), `PROGRESS.md` (a continuously-updated memory of what's been done), and
  `STACK.md` (the tech stack + external providers + env keys + per-provider
  data-residency map).
- **Enforced merge rules** - a `main` ruleset (approval + green checks + no
  force-push) and conventional-commit / PR-title linting.
- **One-shot setup** - a bootstrap script that provisions all of the above in a fresh
  repo.

## Pairs with deep skills (optional)

projectflow handles **what to do and when**. For the **how** of each step it hands off
to deeper single-purpose skills when they're installed - e.g. the
[superpowers](https://github.com/obra/superpowers) set: `brainstorming` to scope work,
`writing-plans`, `test-driven-development`, `systematic-debugging`,
`verification-before-completion`, `requesting-code-review`, and more. Each loop step in
`SKILL.md` is marked with its matching `↳ deep skill`. If those skills aren't
installed, projectflow's own inline guidance takes over - nothing here depends on them.

## Install

Copy the skill into your agent's skills directory:

```bash
# Claude Code (personal)
git clone https://github.com/CaganIslam/projectflow \
  ~/.claude/skills/projectflow
```

Then invoke it (`/projectflow`) or let it trigger on phrases like "I've got an idea
for…" (starts the pipeline), "let's plan this feature", "break this into issues",
"run a bug hunt", "set up the repo".

**Recommended - also install superpowers** (the deep skills each step hands off to):

```bash
# Claude Code plugin (auto-updates, adds the session hook)
/plugin install superpowers@claude-plugins-official

# …or copy the skills manually
git clone https://github.com/obra/superpowers /tmp/superpowers
cp -R /tmp/superpowers/skills/* ~/.claude/skills/
```

projectflow detects them automatically - if they're absent it uses its own inline
guidance instead, so this step is optional but recommended.

## Use it on a project

```bash
scripts/bootstrap-repo.sh <owner>/<repo>
```

This creates the label set, the milestones, the issue/PR templates, the `main`
ruleset, a Projects board, and seeds the four living docs + `CLAUDE.md`. It's
idempotent - safe to re-run to reconcile an existing repo.

## Configure

Set these once per project (the bootstrap asks; `CLAUDE.md` records them):

- **areas** - your layer vocabulary (`frontend, backend, mobile, devops`, or
  `api, web, infra`, …). Drives labels, title prefixes, and branch/commit scopes.
- **milestone scheme**, **test commands**, and the **traceability** system issues
  map back to.

## Layout

```
SKILL.md                    the method (read this first)
CLAUDE.md                   drop-in project memory
docs/DISCOVERY-PIPELINE.md  the eleven stages, the gates, the cross-phase contracts
docs/prompts/               one agent prompt per phase (0-6) + their shared contract
docs/adr/                   this repo's own decision records
commitlint.config.js        commit/PR-title grammar (set your areas)
scripts/bootstrap-repo.sh   one-shot repo setup
templates/.github/          issue forms, PR template, branch ruleset
templates/docs/             living-doc + ADR seeds
```

## License

MIT © CaganIslam
