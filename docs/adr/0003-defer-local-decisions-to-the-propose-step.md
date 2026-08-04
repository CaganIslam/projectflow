# 3. Defer issue-local decisions to the propose step

- Status: accepted

## Context
Until now the issue body carried a `## Fix` section: a concrete approach, written when
the feature was broken down into issues. That decision is made at the moment of least
context - the scope and the breakdown happen before anyone has the relevant code in
front of them, and by the time the issue is picked up the codebase may have moved.
Decisions baked in early either go stale or get silently overridden during
implementation, leaving the written spec and the shipped change out of sync.

## Decision
Issues carry **options, not decisions**. The `## Fix` section becomes `## Options`:
the viable approaches, one line of trade-off each, contracts in fenced code blocks
where they differ. Whoever picks up the issue decides at the propose step (SKILL.md
§1 step 3), with the current code in front of them - the last responsible moment -
and the maintainer's approval locks the pick in.

Two guardrails keep this from degrading into vagueness:

1. **Only issue-local decisions are deferred.** Anything that reaches beyond the
   issue's own files - a shared contract, a pattern other issues will follow, a
   dependency choice - is decided upfront in `BLUEPRINT.md` (its `## Open decisions`
   section routes each open call to propose-time or upfront) or an ADR, and the
   issue references that decision instead of re-opening it. Without this, two
   parallel issues can pick conflicting approaches.
2. **The pick is recorded.** The chosen option and its one-line why go onto the
   issue as a comment (or an ADR if the choice turned out structural), so the
   decision trail survives.

A single obvious approach needs no fake alternatives: one option written plainly is
a valid `## Options` section.

## Consequences
- Decisions are made against the current code, not weeks-old assumptions, and the
  existing propose → approve → implement gate absorbs the choice with no new step.
- The maintainer still approves every pick, so deferral does not weaken the gate.
- Issues are slightly less prescriptive up front; estimation leans on the options
  list rather than a fixed plan.
- The classification (local vs cross-cutting) is a judgment call; misclassifying a
  cross-cutting decision as local can let parallel issues diverge until review.
- The written trail moves: what `## Fix` used to state upfront now lives in the
  issue's decision comment, so skipping the record step loses the "why" history.
