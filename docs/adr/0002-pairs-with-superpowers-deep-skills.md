# 2. Pairs with the superpowers deep skills

- Status: accepted

## Context
projectflow orchestrates the **what** and **when** of a GitHub workflow: turn
requirements into issues, work them one at a time, propose before doing, verify, review,
and ship through milestones. It says little about the **how** of each step, and each step
is real depth on its own — test-driven development, writing a plan, systematic debugging,
running a code review. That depth already exists as the superpowers deep skills
(`github.com/obra/superpowers`). Reinventing it inside this repo would duplicate a large,
well-tested body of work and let the two copies drift apart.

## Decision
Pair the workflow with the eleven superpowers deep skills instead of reinventing them.
The coupling is expressed in two places: the step → skill table in `SKILL.md` §0.5, and
inline `↳ deep skill` markers at each step where a skill applies. The steps map as:

1. discovery / feasibility → `brainstorming` + `dispatching-parallel-agents` /
   `deep-research`, then `writing-plans`
2. requirements → issues → `brainstorming`
3. propose the approach → `writing-plans`
4. implement → `test-driven-development`
5. independent parallel work → `dispatching-parallel-agents`
6. branch isolation → `using-git-worktrees`
7. a failure / test breaks → `systematic-debugging`
8. before claiming "done" → `verification-before-completion`
9. before opening a PR → `requesting-code-review`
10. acting on review feedback → `receiving-code-review`
11. merge / close the branch → `finishing-a-development-branch`

These skills are an **optional power-up**, never a hard dependency. If the matching skill
is installed and the step genuinely needs it, invoke it; otherwise fall back to the inline
description carried in `SKILL.md` for that step. Every step has such a fallback, so the
repo stands on its own with none of the deep skills installed.

Checking the table is an always-on guardrail: every turn, find the current step and, if it
genuinely needs its mapped skill, invoke that skill before doing the step. Looking is
mandatory; whether the skill is needed is a judgment call.

The split is deliberate. projectflow owns the **what/when** (the sequence, the gates, the
labels, the living docs); the deep skills own the **how** (the technique inside one step).
These eleven were chosen because each maps one-to-one onto a step this workflow already
has, so the pairing adds depth without adding new steps.

## Consequences
- Each step gains real depth without this repo reinventing it, and the two bodies of work
  stay separately maintained.
- With no deep skills installed the workflow still runs end to end on its inline
  fallbacks, so it degrades gracefully and has no external requirement.
- There are now two sources to keep in sync: a change to the step model here has to be
  reflected in the table and markers, and a rename on the superpowers side has to be
  mirrored here.
- The mapping has to travel to each project via `CLAUDE.md`, so a project that drops that
  guardrail loses the every-turn check.
- Pinning to an external skill set carries version-drift risk: the skills can move,
  rename, or split, and the table can silently fall out of date until someone reconciles
  it.
