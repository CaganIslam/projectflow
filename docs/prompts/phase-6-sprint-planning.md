# Phase 6 - Sprint Planning

## Role

The person turning a validated design into a backlog somebody can start working
on tomorrow.

This is the handoff. Everything before it is documents; everything after it is
projectflow's existing issue loop. The job is to make the crossing lossless: what
five phases established has to arrive intact as issues, or it was research nobody
acted on.

## Input

- `docs/PRD.md` - the requirements, the enumerated screens and features, and the
  version scope.
- `ARCHITECTURE.md` - and specifically its **deferred decisions** section and its
  **parallel-work boundaries**. Both were written for this phase to consume.
- `docs/CHARTER.md` - the invariants, so nothing planned here violates one.
- `STACK.md` and `docs/adr/` - what has already been decided, and must not be
  re-opened per issue.
- `BLUEPRINT.md` - the verdict, and on a cautious-go, its conditions.

## This phase is not

- **Implementation.** No code, no branches, no PRs.
- **Making the design decisions Phase 5 deliberately left open.** The near miss.
  Those arrive here as options and leave as options; deciding them now would put
  the choice back at the moment of least information, which is exactly what
  deferring them avoided.
- **Re-opening settled decisions.** An ADR is a decision, not a suggestion. If it
  is wrong, that is a new ADR, not an issue quietly doing something else.
- **Estimation in calendar terms.** Order, dependency, and rough size only.
- Redesign of anything in the PRD.

## Method

### Use projectflow's issue format, do not invent one

`SKILL.md` section 3 already specifies it, and a parallel format would leave the
project with two.

- **Title**: area prefix plus a short imperative summary.
- **Labels**: one `area:`, one `priority:`, one type.
- **Body**: `## Problem`, `## Wanted/Scope`, `## Options`, `## Files`,
  `## Definition of Done`.

### Deferred decisions become `## Options`

Each entry in the technical design's deferred-decision section becomes the
`## Options` block of the issue it belongs to, with its one-line trade-off
preserved.

This is the mechanism ADR 0003 describes, and this phase is where it is applied.
Do not collapse an options list into a single recommendation; whoever picks up
the issue decides at propose time with the code in front of them.

A requirement with one obvious approach needs no invented alternatives. One
option written plainly is a valid `## Options` section.

### Split by the boundaries Phase 5 drew

Cross-area work becomes one issue per area with real dependencies wired, not one
large cross-cutting ticket.

The split follows the **module and isolation boundaries** from the technical
design rather than a fresh guess at where the seams are. Work Phase 5 marked as
independent is what can safely run in parallel; work that shares a surface cannot,
whatever the board suggests. Guessing here produces merge conflicts later, at
which point the cause is hard to see.

### Milestones

Per `SKILL.md` section 4: numbered milestones for iteration work, named-phase
milestones for release gates. Each description ends with a `Requirements covered:`
line pointing back at the PRD, so the backlog can be traced to the spec that
produced it.

Order by dependency, never by preference. Blocked issues are marked as blocked
and are not started.

### Completeness check against the PRD

Walk the PRD's enumerated screens and features and confirm each one is covered by
at least one issue. **Report anything not covered**, rather than letting it fall
off quietly.

This check is the reason the PRD was made to enumerate exhaustively. A gap here
is a feature that will never be built, and it will look like a decision nobody
made.

### Nothing is created without approval

Draft the full set first - issues, labels, milestones, and the dependency graph -
and present it. Create nothing until the maintainer approves.

projectflow's guardrail is approval before side effects, and opening thirty
issues unasked is a side effect. Presenting the set also gives the maintainer the
one view where the shape of the whole plan is visible at once, which no single
issue provides.

**Priorities are proposed, not assigned.** Priority is relative to a milestone and
depends on what the maintainer wants to see working first, which this phase has no
way to know. Propose them with a reason, and let them be corrected.

### Hand off explicitly

The phase ends by stating that the pipeline is complete and the `SKILL.md`
section 1 loop takes over from here: show the backlog and its order, let the
maintainer steer, then take one issue at a time through propose, approve,
implement, verify.

Say it rather than trailing off. A pipeline with no stated end leaves the agent
guessing whether more planning is wanted.

## Deliverable

**A draft, presented for approval**, containing:

- The proposed milestones, each with its goal and its `Requirements covered:` line
- Every issue: title, labels, and full body in the section 3 format
- The dependency graph: what blocks what, and what can run in parallel
- The proposed order, with the reasoning for it
- Coverage report: every PRD screen and feature mapped to an issue, and anything
  uncovered called out
- Anything from the PRD deliberately not being planned yet, and why

**After approval**, the issues and milestones are created, and `BLUEPRINT.md`'s
milestone roadmap is updated to match.

**No calendar estimates**, anywhere. Order, dependency, and rough size only.

## Exit condition

Every PRD requirement is covered by an issue or explicitly deferred, deferred
decisions have arrived as `## Options` rather than being resolved, the split
follows Phase 5's boundaries, milestones carry traceability, and the maintainer
has approved before anything was created.

The maintainer is being asked to approve **the plan and the order of work**. This
is the last gate of the pipeline; after it, the normal loop applies and its own
per-issue gate takes over.

---

## Worked example: a mobile physics construction game

> Domain-specific material lives here and nowhere else in this file. The body
> above has to work for a domain nobody has thought about yet.

**Areas in this project** might be `gameplay`, `ui`, `content`, `platform`. The
vocabulary is per-project configuration, not something this phase invents.

**A deferred decision arriving as options.** Phase 5 left beam snapping open:
grid, connection points, or both with a modifier. It arrives in the placement
issue as three options with one line of trade-off each, and is decided at propose
time. Collapsing it to "use connection points" here would waste the deferral.

**Splitting by Phase 5's boundaries.** If the technical design established that
the build UI, the simulation, and the level loader hold separate state, those
become three parallel issues. If they share one state object, they do not,
however independent the features sound.

**A coverage gap worth catching.** The PRD enumerated an accessibility options
screen. If no issue covers it, the coverage report says so now, rather than the
screen simply never existing and nobody being able to point at when it was
dropped.

**Out of scope here**, and tempting: deciding the snap radius, choosing the
physics solver, or writing the first prefab. Those belong to the issues
themselves.
