# Blueprint

> The plan and shape of the project. Keep this honest - if the plan changes, update it.

## What we're building

projectflow is a disciplined, issue-driven GitHub workflow, packaged as a skill an
AI coding agent can follow with a human in the loop. It is a method repo: it ships
documents, a bootstrap script, and templates, not an application. Its users are
maintainers who want requirements to become labelled issues, issues to be worked one
at a time behind an approval gate, and the project's context to survive across
sessions in living docs.

The work in flight is the **discovery pipeline**: seven agent-facing prompts that
carry a raw idea through framing, research, adversarial validation, a charter, a
PRD, technical design, and sprint planning, at which point the existing issue loop
takes over.

## Discovery decision (go / cautious-go / no-go)

- decision: n/a
- rationale: this repo predates the pipeline and was not itself put through it. The
  pipeline is for products being decided on; projectflow's own existence was not a
  question under evaluation.

## How it's built (schema)

The method the repo describes:

```
idea ──▶ discovery pipeline (phases 0-6) ──▶ issues
                                              │
                                              ▼
project ──▶ milestones ──▶ features ──▶ requirements ──▶ issues ──▶ PRs ──▶ release
            gates before each release: QA pass + bug hunt + smoke test
```

The repo that describes it:

```
SKILL.md            the method, read by the agent
CLAUDE.md           drop-in project memory for consuming repos
docs/prompts/       the phase prompts (in progress)
docs/adr/           why the structural decisions were made
templates/          what the bootstrap copies into a new repo
scripts/            the bootstrap itself
```

## Stack

Markdown, YAML, one shell script, and the `gh` CLI. Nothing runs in production and
nothing is deployed. See `STACK.md`.

## Milestone roadmap

Ordered by dependency. No dates: order and blocking relationships only.

| Milestone | Goal | Gate |
|---|---|---|
| Milestone 1: Repo self-bootstrap | projectflow's own repo follows projectflow | none, independent |
| Milestone 2: Discovery pipeline | seven phase prompts, the pipeline doc, the skill wiring | prompt contract (#7) must land before any phase prompt |
| Milestone 3: Working loop improvements | agent working rules, agent organization for the development stage | independent of Milestone 2 |

## The discovery pipeline

Eleven stages carrying an idea from framing to a backlog and then through
building it. The first seven have prompts in `docs/prompts/`; the last four are
the issue loop `SKILL.md` already describes.

The stage list, the gates, and the four contracts that run between non-adjacent
phases are in **`docs/DISCOVERY-PIPELINE.md`**, which owns them. They are not
repeated here.

## Open decisions

> Issue-local decisions live as `## Options` in their issue and are picked at propose
> time. Cross-cutting ones are decided here or in an ADR before dependent issues start.

- ~~Prompt file skeleton and folder layout~~ - decided in #7, see
  `docs/prompts/README.md`.
- ~~Whether the pipeline warrants an ADR~~ - decided in #7, see ADR 0004:
  agent-triggered, depth-switched at Phase 1, prompts stay in this repo.
- ~~Claim ledger format~~ - fixed by #8, since it was written first, and extended
  by #37 with a provenance column. The schema is owned by the prompt contract,
  `docs/prompts/README.md`; #10 reads that shape rather than a copy of it.
- ~~Where the PRD artifact lives~~ - decided in #11: `docs/PRD.md`, with a summary
  and a link in `BLUEPRINT.md` so the plan of record stays readable.

## Open questions

- How much of the pipeline is summarised inline in `SKILL.md` versus left in the
  pipeline document. Enough that an agent that never opens the document still
  behaves correctly on the trigger, and no more (#15).
- Whether `templates/` should eventually carry the prompts too, so bootstrapped
  projects get them. Currently no: they are the maintainer's method, invoked from
  the installed skill.
