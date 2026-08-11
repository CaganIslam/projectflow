# Phase 5 - Technical Design

## Role

The architect deciding how this will be built - and, just as importantly, what
will deliberately not be decided yet.

Prefer explicit over clever. Prefer the design a stranger can follow over the one
that is elegant to its author. Every decision states its reasoning, because a
decision without one cannot be revisited, only overturned.

## Input

- `docs/PRD.md` - what is being built, its entities, its required external
  capabilities, and its non-functional requirements.
- `docs/CHARTER.md` - the invariants. A technical choice that violates one is a
  conflict, not a trade-off to absorb quietly.
- `docs/research/02-validation.md` - the technical risks the red team ranked, and
  the necessary conditions.
- `ARCHITECTURE.md`, `STACK.md`, `docs/adr/` - what already exists, if anything.
  On an existing system, follow what is there rather than proposing a parallel
  structure.

Do not redefine product requirements. Translate them.

## This phase is not

- **Implementation.** No code.
- **Deciding everything.** The near miss, and the one this phase violates. Given
  a long section list, an agent decides all of it at implementation depth to look
  thorough, and leaves the issue loop nothing to weigh. See the boundary below;
  it is the central rule of this phase.
- **Issue creation, milestones, sprint plans, or a backlog.** Phase 6.
- **Estimation**, and never in calendar terms.
- Re-litigating the PRD. A requirement that cannot be built as written is
  reported back, not silently redesigned.

## Method

### The boundary: cross-cutting only

**Decide only what reaches beyond a single issue:**

- shared contracts and interfaces;
- patterns other issues will follow;
- stack, dependencies, and external providers;
- the storage model and schema;
- module boundaries and ownership;
- anything with a security, cost, or data-residency consequence.

**Deliberately leave open** every decision local to one issue's own files.

Each section therefore decides at **contract level, not implementation level**.
State management fixes where state lives and who owns it; it does not fix how a
particular screen reads it. Error handling fixes the shape of failures crossing a
boundary; it does not fix each call site.

**The list of deferred decisions is a required deliverable.** A technical design
without one has not done this phase's job, whatever else it contains. Leaving
decisions open is output, not omission, and saying so explicitly is necessary
because the instinct is to fill every gap.

That list is a **section of this document**, not a separate handoff file. A fifth
document would be one more thing nobody updates. Phase 6 reads the section and
carries each entry into its issue as `## Options`.

### Two boundaries with Phase 4

Stated in both prompts so neither phase decides the same thing twice:

- The PRD names the entities in the user's world and their lifecycle. **This
  phase decides the storage model and schema.**
- The PRD states what capability must come from outside and what it must
  guarantee. **This phase picks the provider**, because that needs the technical
  and cost evaluation the PRD has not done.

### Sections that do not apply

A section that does not apply is marked **"not applicable, because ..."** in one
line, and left there. It is not filled with generic content.

A solo project does not need a rollback strategy, distributed tracing, or a
feature-flag system. Inventing them is worse than omitting them: later phases
read invented material as decided and build on it. Saying "where applicable" once
at the top, as templates usually do, is reliably ignored, so the rule is repeated
at the point of use.

**Some sections cannot be skipped**, or the escape hatch becomes the document:

- component boundaries and responsibilities;
- the data model;
- error handling;
- testing strategy;
- dependencies.

Every project has these, whatever its size.

### Testing attaches to what already exists

`SKILL.md` section 6 already defines two automated layers: a **contract suite**
asserting status, shape, and field names but never exact values, and a **flow
suite** walking multi-step journeys. This phase specifies those for the project
at hand.

It does not invent a parallel test taxonomy. Two incompatible definitions of what
a test layer is would leave every later issue guessing which one applies.

### No separate developer handbook

Coding standards, naming conventions, folder conventions, and performance budgets
are produced here and written into `ARCHITECTURE.md`, which already owns them.

Git, branch, commit, and PR rules are `SKILL.md` section 7, and testing rules
section 6. Reference them; do not restate them. A standalone handbook is a second
copy of rules that already exist in two places, and copies diverge.

### Conflict checks

- **Against the charter.** An invariant like "works without a network" rules out
  whole classes of design. Where a technical choice violates one, report it as a
  conflict; the maintainer decides whether the design changes or the charter is
  amended.
- **Against the PRD's non-functional requirements.** Same treatment.

### Boundaries for parallel work

The isolation boundaries drawn here - module ownership, interface stability, what
can be worked without touching shared files - are what Phase 6 uses to split work
by area and to decide what can run in parallel.

They are an explicit output rather than a side effect. Drawn badly, they surface
later as merge conflicts and blocked issues, at which point the cause is hard to
see.

### Every decision carries its reasoning

Rationale, alternatives considered, trade-offs, risks, long-term consequences,
and a confidence level. Where there is uncertainty, document it rather than
choosing the option that sounds most decisive.

## Deliverable

Written into the project's existing documents rather than a parallel structure.

**`ARCHITECTURE.md`**

- System overview and architecture goals
- Components, their responsibilities, and their boundaries
- Project structure and module boundaries
- Data model
- State and its ownership
- Patterns, and the interfaces and contracts between components
- Error handling and failure shapes
- Testing strategy, attached to the section 6 layers
- Performance budgets
- Coding standards and naming conventions
- Observability and configuration, where they apply
- **Deferred decisions** - the required section, each entry with its options and a
  one-line trade-off, for Phase 6 to carry into issues
- **Parallel-work boundaries** - what can be built independently, and what shares
  a surface

**`STACK.md`** - every dependency and external provider with role, tier, env
vars, data sent, residency, cost, and link. Residency and cost are not optional:
the file doubles as the data-flow map, and a provider entry without them cannot
answer the question the file exists to answer.

**`docs/adr/`** - one ADR per structural decision, written **now** rather than
listed for later. The reasoning is fresh at this moment and reconstructed
afterwards. Context, problem, alternatives, decision, consequences.

**No calendar estimates**, anywhere.

## Exit condition

The cross-cutting decisions are made and recorded as ADRs, the deferred-decision
section exists and is not empty, the mandatory sections are filled, inapplicable
ones carry a one-line reason rather than filler, parallel-work boundaries are
drawn, and charter and PRD conflicts are reported rather than absorbed.

The maintainer is being asked to approve **the shape of the system and what has
been left open**. Both halves matter: an approved design with nothing deferred
means the issue loop has nothing left to decide.

---

## Worked example: a mobile physics construction game

> Domain-specific material lives here and nowhere else in this file. The body
> above has to work for a domain nobody has thought about yet.

**Cross-cutting versus issue-local in this domain.** Cross-cutting: the physics
layer's fixed timestep and how simulation state is separated from presentation;
the save format and its migration story; the contract between a placed structural
piece and the solver. Issue-local, and deliberately deferred: how the placement
preview is drawn, which easing a camera move uses, whether a particular panel
holds its own state or reads a shared one.

**A deferred decision written for Phase 6 to pick up.** Beam snapping: snap to a
grid, or snap to nearby connection points, or both with a modifier. Trade-off in
one line each, decided at propose time with the code in front of whoever picks up
the issue.

**A charter conflict in this domain.** If the charter says failure must always be
explicable from what was on screen, a design that resolves collapse in a single
solver step with no intermediate state violates it. Report it; do not quietly
choose the cheaper solver.

**Sections that would be marked not applicable here**: horizontal scaling,
multi-region residency, and feature flags, for a single-player offline game built
by one person. Each gets one line, not an invented paragraph.

**Parallel-work boundaries here** are what let the build UI, the simulation, and
the level loader be worked as separate issues without collision. If they all read
and write one shared state object, they cannot, and that is worth knowing before
the issues are written rather than after.
