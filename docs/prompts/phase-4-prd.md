# Phase 4 - Product Requirements Document

## Role

The person turning verified research and a set of invariants into a definition of
what will be built.

Not brainstorming, not researching, and not deciding whether to proceed. Those
are done. The job is translation: every requirement here should be traceable to
something an earlier phase established, and where it is not, that is an
assumption and it says so.

## Input

- `docs/CHARTER.md` - the invariants. Referenced, never restated.
- `docs/research/02-validation.md` - the verified findings, the ranked weaknesses,
  and the risks worth designing around.
- `docs/research/01-research.md` - the verified report, including the user-voice
  findings that say what people actually want.
- `docs/research/00-problem.md` - the framed problem and the audience.
- `BLUEPRINT.md` - the verdict, and on a cautious-go, its conditions.

Where the research contradicts the original idea, the research wins.

## This phase is not

- **Technical design.** The near miss. Naming the shape of a solution is a short
  step from naming its implementation, and the moment a requirement specifies
  component structure or storage, Phase 5 has nothing left to decide.
- **A restatement of the charter.** Vision, pillars, and permanent non-goals
  belong there and are referenced here. Two copies drift, and then neither is
  trusted.
- **Stack, dependency, or provider choice.** Phase 5.
- **Issue creation, milestones, or estimation.** Phase 6.
- Research, or revisiting the verdict.
- Code.

## Method

### Ownership split with the charter

The charter owns vision, design pillars, and permanent non-goals. This document
references them and does not repeat them.

The PRD owns requirements, version scope, and success metrics. Its out-of-scope
list means **"not in this version"**; a permanent refusal is a charter anti-goal
and belongs there.

Requirements are checked against the charter as they are written. A requirement
that violates an invariant is **reported as a conflict**, not quietly
implemented. Resolving it means either dropping the requirement or amending the
charter through its ADR procedure, and that choice is the maintainer's, not this
phase's.

### Enumerate everything, and never write "major"

Walk **every screen or surface** and **every feature**, one at a time.

Not the major ones. The word invites skipping, and anything skipped here never
becomes an issue in Phase 6 and therefore never gets built, with nobody noticing
that a decision was made. Completeness here is what makes Phase 6 able to produce
a complete backlog.

Each entry carries:

- what it is for;
- what the user can do;
- inputs and outputs;
- **states, including the empty state and the error states** - the ones most often
  left out, and the ones that generate the most rework when they are;
- dependencies on other entries;
- priority;
- acceptance criteria.

Anything deliberately left out is **listed as left out**. Silence and omission
must not look the same.

### Complete on what and why, not on how

The tempting goal is a PRD so total that an agent could build from it without
asking anything. That goal is wrong, and here is why rather than merely that.

A PRD that decides everything decides it at the moment of least information,
before any code exists. It also turns the propose gate into a formality: the
issues become transcription and the approval step decides nothing. And it rots
fastest, because the most detailed statements are the first to stop matching the
code.

- **In scope**: behaviour, states, acceptance criteria, scope boundaries, success
  metrics, the analytics events that must exist, and the constraints inherited
  from the charter.
- **Out of scope**: implementation, exact timings, animation and transition
  specifics, component structure.

Where those details matter, write them as **constraints** rather than
specifications: "must respond within a frame", "must be reachable one-handed",
"must not require a network round trip". A constraint bounds the solution without
choosing it, which is what leaves Phase 5 and the issue loop something real to
decide.

Interaction, visual, and audio material appears at constraint level for the same
reason.

### Two boundaries with Phase 5

Stated here and in the Phase 5 prompt, so neither phase decides the same thing
twice:

- **Entities.** This document names what exists in the user's world, how those
  things relate, who owns them, and their lifecycle. The storage model and schema
  are Phase 5's.
- **External capability.** This document states what must come from outside and
  what it must guarantee. Choosing the provider is Phase 5's, because that needs
  technical and cost evaluation this phase has not done.

### Traceability, written beside each requirement

Every requirement carries its basis **inline, on the requirement itself**: the
research finding, the charter invariant, or the Phase 0 answer it comes from.

Inline rather than a table at the end, because a table is filled in last and
therefore not at all. A requirement that traces to nothing is labelled an
**assumption**, and "it seems useful" is exactly such an assumption. Assumptions
are allowed; unmarked ones are not, because later phases cannot tell them from
findings.

### Missing information is named, never invented

Where something is not known, write it as an open question. Do not fill the gap
with a plausible detail. An invented specific is worse than an admitted unknown,
because it is indistinguishable from a decision and gets built.

### Justify the significant calls

For each one: the rationale, the alternatives considered, the trade-off, and a
confidence level. Where there is uncertainty, state it.

### No role-play styling

Write precisely, in structure rather than narrative, using tables where they
help. Do not adopt a persona; instructions to write "like a senior product
manager at a top technology company" produce inflated corporate prose rather than
better thinking.

## Deliverable

**`docs/PRD.md`** - its own file. `BLUEPRINT.md` carries a short summary and a
link, rather than the document itself, so the plan of record stays readable.

- Executive summary, referencing the charter's vision rather than restating it
- Research summary: validated assumptions, rejected assumptions, open questions
- Personas and what they are trying to get done
- User journey: entry points, first use, primary flows, edge cases, exit points
- **Functional requirements**: every feature, per the enumeration rules above
- **Information architecture**: every screen or surface, and how they connect
- Non-functional requirements: performance, reliability, security,
  accessibility, localisation, privacy, compliance, offline behaviour
- UX requirements, as principles and constraints
- Conceptual entities, their relationships, ownership, and lifecycle
- Required external capabilities and what each must guarantee
- Analytics and measurement: the events that must exist, and what they answer
- Monetisation, where it applies
- Risks and mitigations
- Assumptions, split into validated and unvalidated
- Dependencies
- Release strategy: this version, then later, ordered by dependency
- Acceptance criteria
- Glossary

Domain-specific section sets belong to the worked example rather than this list.

**No calendar estimates**, anywhere, including the release strategy. Stage names
that imply a schedule are ordering, not dates. Order, dependency, and rough size
only.

### Closing self-check

Before finishing, read the whole document and report:

- contradictions between sections;
- requirements with no acceptance criteria;
- requirements with no traceability and no assumption label;
- screens or features referenced somewhere but never specified;
- anything still ambiguous.

Remaining ambiguity is **listed**, not silently resolved.

## Exit condition

Every screen and every feature enumerated with states and acceptance criteria,
every requirement traced or labelled an assumption, charter conflicts raised
rather than resolved, version scope drawn, and the self-check reported.

The maintainer is being asked to approve **what will be built and what will not**.
Phase 6 turns this into issues, so a gap here becomes work that never happens.

---

## Worked example: a mobile physics construction game

> Domain-specific material lives here and nowhere else in this file. The body
> above has to work for a domain nobody has thought about yet.

**Domain sections this PRD would add**: level structure and how levels are
authored, the difficulty curve, the in-game economy, art direction, audio
direction, and the tutorial's teaching sequence.

**Enumeration in this domain** means every screen: main menu, level select,
build, simulate, pause, success, failure, settings, accessibility options, store.
And every mechanic as its own entry: beam placement, anchoring, deletion, undo,
snapping, stress display, collapse, wind, timed loads.

**A state that gets forgotten here** and then costs a rebuild: what the build
screen shows before the player has placed anything, and what happens when a
structure is valid but the player has run out of material.

**Behaviour versus implementation in this domain.** In scope: placing a beam
snaps to a valid connection point, and an invalid placement is refused with an
explanation rather than silently ignored. Out of scope: the snap radius in
pixels, the tween duration, and whether snapping is computed on drag or on
release. Those are constraints and issue-level decisions respectively.

**A charter conflict worth raising rather than resolving.** If the charter says
the structure is authored entirely by the player, a requirement for an
auto-complete assist violates it. The PRD reports the conflict; the maintainer
decides whether the requirement goes or the charter is amended.
