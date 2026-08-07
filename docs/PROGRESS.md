# Progress log

> The project's memory - what's been done. Newest first.
> **Append an entry after every issue / PR / milestone.** One short bullet block each.

<!-- Template for an entry:

## YYYY-MM-DD — <short title>
- Issue: #N  ·  PR: #M  ·  Milestone: <name>
- What changed: <one or two plain lines>
- Notes for next time: <anything that will save future-you time>
-->

## 2026-08-07 - Repo follows its own method

- Issue: #6 · Milestone: Milestone 1: Repo self-bootstrap
- What changed: three-axis labels and three milestones created; issue forms and the
  PR template installed into `.github/` with the area dropdowns set to this repo's
  vocabulary; `commitlint.config.js` scope list and the `CLAUDE.md` Configuration
  block filled in for this repo; the four living docs created.
- Notes for next time: branch protection was deliberately not applied. The ruleset
  requires approval from someone other than the author, and this is a single-
  maintainer repo, so installing it would block every PR. `gh` here is 2.87, which
  predates native parent/blocked-by (2.94), so issue dependencies are written into
  bodies as `Blocked by #N` text and will not appear as board badges.

## 2026-08-07 - Discovery pipeline planned

- Issues: #7 through #18 · Milestones: 2 and 3
- What changed: the discovery pipeline was designed and broken into issues. Eleven
  stages, of which phases 0 through 6 get agent prompts in this repo and stages 7
  through 10 are pointers into `SKILL.md`. Source prompt material supplied by the
  maintainer for research, red team, charter, PRD, and technical design was reviewed
  and folded into the issue specs.
- Notes for next time: four cross-phase contracts were identified and are recorded
  in `BLUEPRINT.md`. They are the fragile part of the design, because none of them
  is visible from the phase order and breaking one degrades the pipeline quietly.
  The recurring correction while reviewing the source prompts was the same each
  time: a phase restating what another document already owns.

## (start)

- Repo bootstrapped with the projectflow method.
- Living docs created: BLUEPRINT, ARCHITECTURE, PROGRESS, STACK.
