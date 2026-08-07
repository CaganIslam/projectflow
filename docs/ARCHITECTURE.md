# Architecture & conventions

> Constraints, structure, and the patterns this project uses.
> **Read before changing anything** - follow what's here instead of inventing new ways.
> When a structural decision changes, record an ADR in `docs/adr/` and update this file.

This repo ships documents, not code. "Architecture" here means how the documents
relate to each other and which one owns what, because the recurring failure mode in
a method repo is the same rule appearing in two files and the copies drifting apart.

## Folder structure

```
SKILL.md                the method itself, read by the agent at work
CLAUDE.md               drop-in project memory, copied into consuming repos
README.md               what it is and how to install it
commitlint.config.js    commit and PR title grammar
docs/
  BLUEPRINT.md          the plan
  ARCHITECTURE.md       this file
  PROGRESS.md           the memory log
  STACK.md              stack and providers
  adr/                  decision records
  prompts/              the discovery pipeline phase prompts
templates/              what scripts/bootstrap-repo.sh copies into a new repo
  .github/              issue forms, PR template, branch ruleset
  docs/                 the four living docs, seeded empty
scripts/bootstrap-repo.sh
.github/                this repo's own copy of the templates, in use here
```

## Ownership: which file owns which rule

The single most important convention in this repo. A rule lives in exactly one
place, and everything else references it.

| Subject | Owner | Everything else |
|---|---|---|
| The working loop, gates, guardrails | `SKILL.md` | references it, never restates it |
| Per-project memory for consuming repos | `CLAUDE.md` | mirrors SKILL.md's guardrails in short form, kept in sync deliberately |
| Discovery pipeline orchestration | `docs/DISCOVERY-PIPELINE.md` | phase prompts reference it |
| A single phase's instructions | its file in `docs/prompts/` | the pipeline doc summarises, does not duplicate |
| Why a structural decision was made | `docs/adr/` | other docs link to the ADR |
| What has been done | `docs/PROGRESS.md` | nothing else keeps history |

`CLAUDE.md` is the one deliberate duplication in the repo, because it has to travel
into projects that never see `SKILL.md`. It is kept short and updated in the same
change as the rule it mirrors, never separately.

## Patterns & methods we use

- **Documents state what they forbid.** A section that cannot rule anything out is
  decoration. This applies to the phase prompts especially, where each phase carries
  an explicit list of what it may not produce.
- **Options, not decisions.** Issue-local choices are written into the issue as
  `## Options` with a one-line trade-off each and picked at propose time. Only
  cross-cutting calls are settled upfront, here or in an ADR. See ADR 0003.
- **Omission is stated, never silent.** Something deliberately left out is written
  down as left out, so that absence and oversight do not look the same.
- **Domain-agnostic body, worked example for the rest.** Nothing in the method is
  tied to one stack or domain. Domain-specific material goes in a clearly marked
  example, never in the body.
- **Naming:** phase prompts are `docs/prompts/phase-<n>-<slug>.md`; ADRs are
  `docs/adr/NNNN-<slug>.md`; branches are `<type>/<area>/<slug>-<issue>`.

## Constraints (the "always / never" list)

- Always: English for everything committed to the repo.
- Always: one rule, one owner. Cross-reference instead of copying.
- Always: order and dependency instead of calendar estimates.
- Never: AI attribution in commits or PRs, and no `Co-Authored-By` trailers.
- Never: em dashes in prose. Plain hyphens.
- Never: a second document describing something `SKILL.md` already describes.

## Tooling

- commit/PR grammar: `<type>(<area>): subject`, see `commitlint.config.js`
- areas: `skill, prompts, docs, templates, scripts, repo`
- no CI, no test suite, nothing deployed. Verification is reading the changed files
  and checking that a claim in one is not contradicted in another.
- `gh` on this machine is 2.87, which predates native issue parent/blocked-by
  (2.94). Dependencies are written into issue bodies as `Blocked by #N` instead, so
  they will not show as board badges.

## Decisions

See `docs/adr/` for the rationale behind structural choices.
