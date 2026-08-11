# Phase 3 - Product Charter

## Role

The person who decides what this product *is*, and writes it down so that a
future decision can be held against it.

Everything before this phase established what is true about the world. This phase
states what will be true about the product regardless of what happens later. It
is short, it is durable, and it is the only artifact in the pipeline whose value
comes from not changing.

Domains have their own name for this artifact - a games project calls it the Game
Design Bible, a company calls it a product charter or a set of principles - and
the job is the same in each.

## Input

- `docs/research/02-validation.md` - the verified findings and, specifically, the
  **necessary conditions** the red team identified. Those become standing
  constraints here rather than being rediscovered later.
- `docs/research/01-research.md` - the verified report, and the opportunity map:
  what makes this worth choosing over the alternatives that already exist.
- `docs/research/00-problem.md` - who this is for, and what they are trying to do.
- `BLUEPRINT.md` - the verdict. On a cautious-go, its conditions belong here as
  constraints.

Where the research contradicts the original idea, the research wins, and the
charter says so at the point where it happens rather than quietly siding with the
idea.

## This phase is not

- **Specification.** The near miss. Every invariant wants to grow into a feature
  description, and the moment it does, this becomes a second PRD and the split
  between the two documents collapses. State the property; do not design what
  satisfies it.
- **Requirements, features, scope, or acceptance criteria.** All Phase 4.
- **Metrics and success measures.** Also Phase 4.
- Technical design, stack, or architecture.
- Research, or revisiting the verdict.
- Code.

## Method

### The admission test

Every section must answer: **what does this forbid?**

A section that cannot rule anything out is decoration, and it belongs in the PRD
or nowhere. This is the filter that stops the charter from growing into a second
design document, which is the failure it exists to prevent. Apply it to each
section as it is written, not at the end.

### Pillars: three to five, each with a violation clause

Not ten. Ten immutable pillars means none of them is immutable, and a proposal
that conflicts with one can always be defended by appealing to another.

Each pillar carries three things, all required:

- why it exists;
- what supports it;
- **what would violate it** - the concrete test a future proposal is held
  against. A pillar with no violation clause is an opinion with a heading.

### Name the trade-offs, or the quality bar decides nothing

Every quality goal states what it beats and what beats it.

"Depth with simplicity" is not a commitment until the document says which one
wins when they conflict. Every product wants to be deep, simple, fast, and
beautiful; listing those is a wish, not a charter. The trade-offs are the part
that settles arguments eighteen months from now, and a charter whose qualities
never trade against each other will settle nothing.

### Cite the basis of every pillar

Each pillar rests on one of three things, and says which:

- a finding from Phase 1;
- a necessary condition from Phase 2;
- the maintainer's own preference.

A labelled preference is legitimate. Plenty of what makes a product distinctive
is taste, and taste is a valid reason. An *unlabelled* preference is a preference
wearing evidence's clothes, and every later phase will treat it as established.

### Invariants must be falsifiable and decision-relevant

Phrased so that a proposed change can be held against them and answered yes or
no. "It should feel good" fails. A named property that no future change may
violate passes.

### Justify, do not assert

The charter is the one artifact whose contents are pure judgement, so each
significant call states the alternatives considered, the trade-off, and why this
one. A charter that only asserts cannot be argued with later, which sounds like
strength and is the opposite: an invariant nobody can evaluate is one nobody can
apply.

### When to skip this phase

Some projects have no identity worth protecting: internal tooling, a library, a
one-off script. Running this phase there produces ceremony.

If it is being skipped, **say so and say why**, in `BLUEPRINT.md`. A skipped
phase and a forgotten phase must not look the same.

## Deliverable

**`docs/CHARTER.md`**

Its own file, not a section of `BLUEPRINT.md`. `BLUEPRINT.md` is the living plan
and changes constantly; putting a document whose value is stability inside one
that churns loses the distinction that makes it useful.

- **Vision** - what this is and why it should exist, specific enough to rule
  things out. A vision compatible with everything constrains nothing.
- **Design pillars** - three to five, each with its why, its support, its
  violation clause, and its basis.
- **Who it is for, and what they are trying to do** - from Phases 0 and 1, not
  reinvented.
- **The core experience** - first contact through long-term use, as an arc rather
  than a feature list.
- **Quality bar** - each goal with what it beats and what beats it.
- **Success and failure** - what success should feel like, what failure should
  teach, what must never become punishing.
- **Identity and interaction philosophy** - how it should feel to use and what
  makes it recognisable, at the level that stays true. Domain surfaces (visual
  and audio direction for a game, tone and voice for a service) appear here only
  in their invariant form; specifying them is Phase 4's job.
- **Anti-goals** - what this will never be, and what must never be added.
  Distinct from the PRD's out-of-scope, which only means "not in this version".
  Written **last**, after the pillars, so it is derived from them rather than
  guessed.
- **Decision principles** - how a conflict between two pillars is settled.
  Without these, conflicts are settled by whoever is speaking.
- **Standing constraints** - the necessary conditions from Phase 2, and any
  cautious-go conditions.
- **Evolution boundaries** - how this can grow over years without ceasing to be
  itself.
- **Amendment procedure** - see below.

### Length discipline

The pillars fit on one screen. A charter nobody can hold in their head is a
charter nobody checks against, and an unchecked charter is worse than none: it
creates the appearance of alignment without the substance.

### Amendment procedure

The charter can change. It changes through an **ADR in `docs/adr/`**, with the
context, what is being amended, and why. Not through an edit, and not through a
changelog kept inside the charter, which would be a second decision-record system
alongside the one the project already has.

Without a procedure a charter is either ignored or becomes a straitjacket, and
both are worse than not having one.

## Exit condition

Three to five pillars, each with a violation clause and a stated basis. Every
quality goal names its trade-offs. Anti-goals derived from the pillars rather than
listed first. An amendment procedure. The pillars fit on one screen.

The maintainer is being asked to approve **what must remain true**, which is a
heavier approval than it looks: from here on, a PRD requirement that violates an
invariant is raised as a conflict, and resolving it means either dropping the
requirement or amending the charter.

---

## Worked example: a mobile physics construction game

> Domain-specific material lives here and nowhere else in this file. The body
> above has to work for a domain nobody has thought about yet.

**A pillar with a real violation clause.** *Failure teaches.* Why it exists:
Phase 1 found that abandonment in this genre clusters around failures players
cannot explain. What supports it: visible stress and strain before collapse, and
a replay of what gave way. What would violate it: any failure state whose cause
is not observable from what was on screen. Basis: Phase 1 user-voice finding.

**A trade-off that has to be named.** Realistic simulation against predictable
controls. Both are wanted; they conflict at the margin, where a physically
accurate result feels arbitrary. The charter says which wins, and the answer
governs a hundred later decisions without any of them being reopened.

**A quality goal that is a wish, not a commitment.** "Deep but accessible" as
written. As a commitment: when depth and accessibility conflict, accessibility
wins for the first hour of play and depth wins afterwards.

**An anti-goal derived from a pillar.** If a pillar says the player's structure
is authored entirely by them, then any system that auto-completes or corrects a
structure is an anti-goal, however well it would test.

**Domain material that belongs here in invariant form only**: a stated visual
identity such as readability over spectacle. The palette, the typography, and the
particle work are Phase 4.

**A standing constraint from the red team.** If Phase 2 concluded the plan only
works when the game is discoverable without a store featuring slot, that is a
necessary condition and it belongs here, not as a hope in a marketing section.
