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

Eleven stages. The first seven are defined by prompts in this repo; the last four
are pointers into `SKILL.md`, because the issue loop already describes them and two
descriptions of one loop drift apart.

```
0  Idea & Problem Framing         prompt   kill criteria registered here
1  Exhaustive Research            prompt   short/deep switch, claim ledger
                                           + opportunity and white-space map
2  Concept Validation / Red Team  prompt   verification loop, then attack
                                           -> GO / CAUTIOUS-GO / NO-GO
3  Product Charter                prompt   the invariants  (games: Design Bible)
4  PRD                            prompt   requirements, scope, metrics
5  Technical Design               prompt   cross-cutting decisions only
6  Sprint Planning                prompt   -> issues are created here
--------------------------- handoff ---------------------------
7  Development     -> SKILL.md section 1, the issue loop
8  User Testing    -> SKILL.md section 6 QA + section 5 bug hunt
9  Iterate         -> back to 7, with a defined exit condition
10 Launch          -> SKILL.md section 8, deploy gating
```

Four contracts run between non-adjacent phases. None is visible from the order
alone, and breaking one degrades the pipeline silently rather than loudly:

- Phase 0's kill criteria are what Phase 2's verdict is decided against.
- Phase 1's claim ledger is what Phase 2's verification loop consumes.
- Phase 3's charter is what Phase 4 references and must not restate.
- Phase 5's module boundaries are what Phase 6 splits issues along.

## Open decisions

> Issue-local decisions live as `## Options` in their issue and are picked at propose
> time. Cross-cutting ones are decided here or in an ADR before dependent issues start.

- Prompt file skeleton and folder layout - cross-cutting, decided in #7 before any
  phase prompt is written.
- Claim ledger format - a contract between #8 and #10; whichever is implemented
  first fixes it.
- Whether the pipeline warrants an ADR (agent-triggered phases, depth switch,
  prompts stay in this repo) - decided while doing #7.

## Open questions

- How much of the pipeline is summarised inline in `SKILL.md` versus left in the
  pipeline document. Enough that an agent that never opens the document still
  behaves correctly on the trigger, and no more (#15).
- Whether `templates/` should eventually carry the prompts too, so bootstrapped
  projects get them. Currently no: they are the maintainer's method, invoked from
  the installed skill.
