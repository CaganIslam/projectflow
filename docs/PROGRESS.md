# Progress log

> The project's memory - what's been done. Newest first.
> **Append an entry after every issue / PR / milestone.** One short bullet block each.

<!-- Template for an entry:

## YYYY-MM-DD — <short title>
- Issue: #N  ·  PR: #M  ·  Milestone: <name>
- What changed: <one or two plain lines>
- Notes for next time: <anything that will save future-you time>
-->

## 2026-08-11 - Phase 0 framing prompt

- Issue: #9 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/phase-0-idea-and-problem-framing.md`. Questions asked
  in topic batches rather than one at a time or as a single form, and a batch is
  not left until it is understood. Three batches: the problem, what is being
  assumed, and constraints plus kill criteria.
- Notes for next time: the line that took the most care is what this phase may
  challenge. It questions internal inconsistency ("these two answers cannot both
  be true") and not merit ("this space looks crowded"), because the second needs
  evidence that does not exist yet. The test written into the prompt: a challenge
  the maintainer can settle by thinking belongs here, one that needs a source
  belongs to Phases 1 and 2.

## 2026-08-11 - Phase 1 research prompt

- Issue: #8 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/phase-1-exhaustive-research.md`. Depth switch asked
  of the maintainer, eight fixed lanes plus two to four domain lanes the agent
  proposes and the maintainer confirms, lanes isolated until all finish,
  competitor lane fanned out by segment, every claim labelled and tiered at write
  time, and an opportunity map that describes gaps without proposing what fills
  them. The claim ledger format was fixed here since this phase was written first.
- Notes for next time: the prohibition worth writing carefully is the adjacent
  one. This phase does not accidentally write a PRD; it slides into recommending
  features, and into leaning toward a verdict Phase 2 is supposed to reach. Both
  are listed first in the prohibition list for that reason.

## 2026-08-11 - Phase prompts have a contract

- Issue: #7 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/README.md` fixes the six-section skeleton every phase
  prompt follows, the file and artifact paths, and the rules that apply to all
  seven. `_skeleton.md` is the copy-ready template. ADR 0004 records the three
  cross-cutting decisions: the agent triggers the pipeline, Phase 1 asks the
  maintainer for depth, and the prompts stay in this repo rather than in
  `templates/`.
- Notes for next time: the prohibition list is the section that carries the
  pipeline, and the rule worth remembering while writing each prompt is that the
  violated prohibition is always the adjacent one. A research phase never writes a
  PRD by accident; it slides into recommending features. Write the near miss, not
  the distant one.

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
