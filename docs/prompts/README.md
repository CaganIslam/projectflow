# Phase prompts - the contract

The discovery pipeline is seven agent-facing prompts, one per phase. This file
fixes what they all have in common, so that they can be written one at a time
without drifting into seven different shapes.

Read this before writing or changing any phase prompt. This file is only about
the prompts; the pipeline as a whole, including the phase order, the gates, and
the contracts between phases, is in `docs/DISCOVERY-PIPELINE.md`.

## Why a contract at all

The pipeline works because each phase refuses to produce the next phase's output.
Research does not design. Validation does not redesign. The charter does not
specify. The PRD does not choose architecture. Remove that property and the
phases collapse into one long document written by an agent that jumps to the
solution, which is the failure the pipeline exists to prevent.

That property lives in one section of each prompt. If it is written differently
in each file, or missing from some, the pipeline has no spine. So the shape is
fixed here rather than left to whoever writes the next prompt.

## The skeleton

Every phase prompt has these six sections, in this order, with these headings.
A section that is one line stays as one line; it is not dropped. Predictability
matters more than economy here, because the agent reading these files is looking
for a known shape.

### 1. Role

What the agent is acting as for this phase, in one or two sentences.

State the stance, not a job title with a company attached. "An independent review
body permitted to conclude that the project should be abandoned" is a stance and
it changes behaviour. "A world-class principal engineer at a top technology
company" is costume, and it produces inflated prose rather than better work.

### 2. Input

Which artifacts this phase reads, by path. Phase 0 reads the maintainer's raw
idea; every later phase reads what came before it.

Where an input is a contract with another phase, say so and name it, because a
reader of one file cannot see the other end. Where a phase must not read
something, say that too.

### 3. This phase is not

The prohibition list. The load-bearing section, and the reason the contract
exists.

An explicit list of outputs this phase may not produce, named as artifacts rather
than described as attitudes. "Do not get ahead of yourself" forbids nothing. "Do
not write requirements, features, scope, architecture, or code" forbids
something.

Include the near misses, not only the obvious ones. The prohibition an agent
actually violates is the one adjacent to its real job: a research phase does not
write a PRD by accident, but it slides into recommending features very easily.

### 4. Method

How the work is done. Whether the phase fans out to parallel agents, and if so on
what axes; whether agents stay isolated until finished; whether anything loops,
and what stops the loop.

Any loop states its termination conditions here, all of them. A loop with one
brake does not terminate reliably.

### 5. Deliverable

The artifact: its path, its required sections, and any machine-readable output
another phase consumes.

If a later phase reads part of this output as structured data, its format is part
of this section and not an implementation detail.

### 6. Exit condition

What must be true to hand off, and what the maintainer is being asked to approve.

Every phase ends at a gate. The prompt names what the maintainer is deciding, so
the approval is a decision rather than a nod.

## Rules that apply to all seven

**Agent-facing, not maintainer-facing.** These are instructions an agent follows
when the pipeline is running. They are not text for the maintainer to paste
somewhere else. Where a phase is expensive or ambiguous, it asks the maintainer a
question rather than assuming an answer.

**Domain-agnostic body.** Nothing in the main text assumes a domain. Games, SaaS,
hardware, and internal tooling all have to fit. Domain-specific material goes in
a clearly marked worked example at the end of the file, never in the body. A
prompt whose body mentions physics engines or app store featuring has already
failed this.

**One owner per rule.** A prompt references what another document owns; it does
not restate it. `SKILL.md` owns the working loop and the guardrails. The charter
owns the invariants. This file owns the skeleton. Restating any of them creates a
second copy that will drift.

**Omission is stated.** Anything a phase deliberately leaves out is written down
as left out. Silence and oversight must not look the same, in the prompts or in
the artifacts they produce.

**No calendar estimates**, anywhere, in any phase output. Order, dependency, and
rough size only.

## Files and paths

Prompts live here and are named `phase-<n>-<slug>.md`:

| Phase | File |
|---|---|
| 0 Idea & Problem Framing | `phase-0-idea-and-problem-framing.md` |
| 1 Exhaustive Research | `phase-1-exhaustive-research.md` |
| 2 Concept Validation / Red Team | `phase-2-concept-validation.md` |
| 3 Product Charter | `phase-3-product-charter.md` |
| 4 PRD | `phase-4-prd.md` |
| 5 Technical Design | `phase-5-technical-design.md` |
| 6 Sprint Planning | `phase-6-sprint-planning.md` |

Where each phase writes, in the project being built (not in this repo):

| Phase | Artifact |
|---|---|
| 0 | `docs/research/00-problem.md` |
| 1 | `docs/research/01-research.md` and `docs/research/01-claims.md` |
| 2 | `docs/research/02-validation.md`; the verdict into `BLUEPRINT.md` |
| 3 | `docs/CHARTER.md` |
| 4 | `docs/PRD.md`; `BLUEPRINT.md` carries a summary and a link |
| 5 | `ARCHITECTURE.md`, `STACK.md`, `docs/adr/` |
| 6 | GitHub issues and milestones |

These prompts stay in this repo and are not copied into `templates/`. The
reasoning, and what it costs, is in ADR 0004.

## The claim ledger

The ledger is a contract between phases 1 and 2. Phase 1 writes it, Phase 2
iterates over it and updates it in place: `docs/research/01-claims.md`, a table
with the columns id, claim, tier, label, provenance, source, where. Phase 2 reads
that shape rather than redefining it.

Four of those columns ask different questions about the same sentence, and they
are easy to collapse into one another:

- **label** - what kind of statement it is: fact, evidence, hypothesis, opinion
- **tier** - what turns on it: decision-flipping, supporting, colour
- **provenance** - where it came from, below
- **source** - where to go and check

### Provenance

Assigned by whoever writes the claim, at the moment they write it.

| Value | Meaning |
|---|---|
| `generated` | nobody observed this; an agent produced it |
| `sourced` | a document, dataset, or public record states it |
| `stated` | someone said they would do something, or that it would be useful |
| `described` | someone described what they do today and what it costs them |
| `revealed` | someone already spends money, time, or attention on a worse version of this |
| `committed` | someone has committed to this one |

The last four are ordered, weakest to strongest, and they are the values that
carry a claim about demand. `sourced` sits outside that ordering: a document is a
different kind of thing from a person's behaviour, not a stronger or weaker
version of it.

**Provenance is about what happened, not about how you found out.** The `source`
column already records how you found out. So a dataset showing people spending
hours on a near equivalent is `revealed`, even though you read it in a document,
because somebody did something. A market report sizing a category is `sourced`,
because nothing in it is a person acting on this need.

**Choosing one of the four ordered values is what makes a claim a demand claim.**
No separate step decides which claims those are, and none should be added.
Whoever writes the sentence already knows whether it is about what someone would
do, and a later phase re-reading several hundred sentences to work it out is
exactly the expensive, unreliable pass the write-time tiering rule exists to
avoid.

**The threshold sits between `stated` and `described`.** Below it, a claim is
evidence of interest rather than of demand. What people say they would do is a
poor predictor of what they do, and every domain has its own version of the
polite yes.

The rungs are about behaviour, not about money. `revealed` reads as an existing
subscription for a business tool, as hours already spent on a rough equivalent
for a game, as a spreadsheet somebody maintains by hand every week for an
internal tool, and as projects vendoring a workaround for a library.

**A `generated` claim can never carry the label `fact` or `evidence`.** It is a
hypothesis at best, whatever it sounds like. This is a property of the ledger and
holds wherever the ledger is written. What the verdict may rest on is Phase 2's
rule and lives in its prompt.

## Writing a new phase prompt

Copy `_skeleton.md`, fill the six sections, and check it against this file. The
questions worth asking before it is done:

- Does the prohibition list name the *adjacent* temptation, not only the distant
  one?
- Would this text still make sense for a domain nobody has thought about yet?
- Does any loop in it have more than one way to stop?
- Does it restate something another document already owns?
- Is anything left out silently?
