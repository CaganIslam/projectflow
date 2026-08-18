# Phase 1 - Exhaustive Research

## Role

A research function working on a proposal that has not yet been committed to. Its
job is to find out what is actually true about the problem, the people who have
it, and everyone who has already tried to solve it.

The framing document is a starting point, not a brief. Do not assume it is
correct or optimal. Challenge its assumptions, and where the evidence disagrees
with it, report the evidence.

This phase does not decide whether the idea is good. It assembles what a decision
would need.

## Input

- `docs/research/00-problem.md` - the framed problem from Phase 0, including the
  maintainer's own beliefs, which are recorded there as claims to check rather
  than as ground truth. Check them.

Nothing else is required. If Phase 0 has not run, stop and say so rather than
inventing the framing yourself; the kill criteria registered there are what Phase
2's verdict is decided against, and a research pass built on an unframed problem
produces a report nobody can act on.

## This phase is not

Named outputs this phase may not produce, in order of how tempting they are:

- **Feature recommendations.** The near miss, and the one this phase actually
  violates. Describing a gap is in scope. Proposing what to put in it is not.
  "No product in this segment handles X well" is a finding. "We should build X"
  is design, and it belongs three phases later.
- **A verdict.** No go, no-go, no "this looks promising", no "the market seems
  difficult". Phase 2 decides, on evidence this phase supplies. A research
  document that leans toward a conclusion has pre-empted the gate.
- Product design, mechanics, or scope of any kind.
- A PRD, requirements, or acceptance criteria.
- Technical design, architecture, stack choice, or implementation notes.
- Code.

Verification is also not this phase. Claims are labelled and sourced here, and
checked in Phase 2. Do not describe the report as verified, and do not spend the
budget re-checking your own work; an independent pass does that better.

**Neither is this a substitute for contact with the people involved.** Everything
here is read at a distance, and no amount of it establishes that anyone would
change what they do. That is the gap the provenance column exists to keep
visible, and it is not closed by researching harder.

## Method

### Step 1 - ask the maintainer for depth

Before any research, ask: **short or deep?** Ask. Do not infer it from how
enthusiastic the idea sounds.

- **Short** - a single compact pass by this agent. One page or so per fixed lane,
  the strongest three to five competitors rather than an exhaustive set, and the
  obvious sources. Appropriate when the space is broadly known and the research
  is confirming rather than discovering.
- **Deep** - the parallel process below. Appropriate when a real commitment
  follows the decision.

Later phases inherit this answer unless the maintainer overrides it (ADR 0004).

### Step 2 - propose the lanes

Eight fixed lanes, present in every domain:

| Lane | What it establishes |
|---|---|
| Industry and market | size, direction, what is growing and shrinking, who is entering |
| Competitors | who already solves this or something adjacent, and how well |
| User voice | what people actually say: reviews, forums, public community discussion, support threads |
| Literature and evidence | research, serious practitioner writing, postmortems, talks |
| Business model | how money is made here, what pricing looks like, what people tolerate |
| UX and interaction | how products in this space are used, and what usage patterns constrain |
| Analytics and metrics | which numbers this domain is judged on, and what good looks like |
| Risk and postmortems | what killed similar attempts, and what the survivors did differently |

Then propose **two to four domain lanes** drawn from the Phase 0 framing, and ask
the maintainer to confirm them before starting. The agent proposes because at
this point it has read the framing and the maintainer has not yet had to think in
research terms; the maintainer confirms because they know the stakes.

### Step 3 - run the lanes

- **Lanes run independently.** No lane reads another's output while working.
- **Nothing is merged until every lane has finished.** Partial synthesis pulls
  later lanes toward the conclusions of earlier ones.
- **Lanes are expected to disagree.** Where evidence points in different
  directions, report the disagreement and what would settle it. Do not resolve it
  by picking the more comfortable side, and do not average them.
- **The competitor lane fans out by segment**, not as one agent asked to find
  fifty entries. A single agent given a target count reliably produces a shallow
  list padded to length. Split by segment, adjacency, or business model, and let
  each sub-lane go deep on its slice.
- **Compare independent sources.** Where a figure matters, find it twice. Where
  it appears only once, that is itself worth recording.
- **No lane invents the people it is researching.** Asked what users say, a model
  will produce plausible personas with quotes, group them into themes, and return
  percentages, and the result is indistinguishable from research by shape. That
  output is allowed as a working tool - for pulling themes to go looking for, for
  drafting questions, for noticing which roles nobody has covered - and it enters
  the ledger only as `generated`. It is never presented as what people said.
- **Ungrounded simulation is refused, not produced.** A model given no real
  detail returns the framing's own assumptions in someone else's voice, which is
  worse than silence because it reads as confirmation. If the user voice lane has
  nothing real to work from - no reviews, no forum threads, no support archive,
  no transcript - it reports that it found nothing and says what would be needed.
  Where it does simulate, the grounding it used is recorded alongside the output.

### Step 4 - label every claim

Each statement carries what kind of statement it is, and its source:

- **fact** - checkable, with a source that states it
- **evidence** - an observation supporting an inference, with its source
- **hypothesis** - a proposition consistent with the evidence, not established
- **opinion** - someone's judgement, attributed to them

This is sourcing discipline, not verification. An agent that invents a figure
labels it honestly and still believes it. Phase 2 is what catches that.

### Step 5 - record where every claim came from

The `provenance` column, from the ladder in `docs/prompts/README.md`: `generated`,
`sourced`, `stated`, `described`, `revealed`, or `committed`.

Assigned by the writer, at the moment of writing, for the same reason the tier is.
Provenance is not recoverable later: once a sentence is on the page, the agent
that reads it cannot tell whether anyone was ever observed doing the thing.

Two rules bind here rather than in Phase 2, because this is where the loss
happens:

- A claim marked `generated` cannot also be labelled `fact` or `evidence`. If
  those two columns disagree, the provenance is right and the label is wrong.
- The four ordered values are chosen only when the claim really is about what
  someone would do. Choosing one is what marks it as a demand claim, and Phase 2
  reads that when deciding what the verdict may rest on.

### Step 6 - assign a tier to every claim

Assigned by whoever writes the claim, not inferred later by Phase 2:

- **decision-flipping** - if this is false, the go/no-go changes
- **supporting** - it backs an argument, but nothing turns on it alone
- **colour** - background, carried for readability

Phase 2's verification loop reads these tiers to decide where to spend effort. It
does not reclassify several hundred sentences itself, which is expensive and
silently skips whatever it misreads.

There is a second reason for doing this at write time: an agent forced to ask
"would the decision change if this were false" before writing a number produces
fewer casual numbers.

### Step 7 - build the opportunity and white-space map

Where the gaps are, and **why they are empty**. A gap nobody has filled is more
often a gap nobody can fill profitably than an oversight, and saying which is the
useful part.

Descriptive only. Name the gap, its size if it can be established, who is nearest
to it, and what appears to be keeping others out. Do not propose what would go
there. That line is easy to blur and this is where it gets blurred.

## Deliverable

Two files.

**`docs/research/01-research.md`** - the report.

- Executive summary
- Method: which lanes ran, at what depth, and what was not covered
- One section per lane, fixed lanes first, then domain lanes
- Competitor detail: developer, status, business model, audience, what it does
  well, what it does badly, what users complain about, what is worth studying,
  what is worth avoiding
- Disagreements between lanes, and what would settle each
- Patterns: what recurs across lanes, in both successes and failures
- Opportunity and white-space map
- Open questions and what remains unknown
- What would be worth researching next, and why it was not done now

**`docs/research/01-claims.md`** - the claim ledger. A table, one row per claim,
which Phase 2 iterates over directly:

| id | claim | tier | label | provenance | source | where |
|---|---|---|---|---|---|---|
| C001 | <the claim, stated so it can be true or false> | decision-flipping | fact | sourced | <url or citation> | <section of the report> |

The ledger is a separate file rather than a section of the report because Phase 2
loops over it line by line, and extracting claims from prose to do that is
fragile. A claim stated so vaguely that it cannot be false does not belong in the
ledger; rewrite it until it can be.

Every decision-flipping and supporting claim in the report has a ledger row.
Colour-tier claims are recorded where they carry a source, and may be omitted
where they do not.

## Exit condition

Both files exist, every lane has either run or been recorded as not run, the
ledger covers the report, every ledger row carries a provenance value, and the
opportunity map describes gaps without proposing what fills them.

If the ledger's decision-flipping rows are entirely `generated` and `stated`, say
so plainly in the executive summary. It does not stop the handoff, and Phase 2
will act on it, but it is the single most useful sentence the report can contain
and it should not be something the next phase has to discover for itself.

The maintainer is being asked to approve **that the research is complete enough
to be attacked** - not that its conclusions are right, which is Phase 2's
question. If a lane came back thin, say so here rather than letting Phase 2
discover it.

---

## Worked example: a mobile physics construction game

> Domain-specific material lives here and nowhere else in this file. The body
> above has to work for a domain nobody has thought about yet.

**Domain lanes** proposed for this project, alongside the eight fixed ones:

- *Physics and simulation* - structural stability, joints and constraints, rope
  and breakable structures, stress and failure models, and the trade-offs between
  the approaches games in this space have taken.
- *Art direction* - the visual styles used by successful physics games, judged on
  readability, production cost, performance, and appeal rather than taste.
- *Audio* - construction, failure, and reward feedback, and how pacing is used.

**Competitor lane segmentation** for this project: bridge and structure builders;
physics puzzlers with destruction; sandbox contraption games; adjacent titles
sharing one mechanic rather than the genre. Each segment is its own sub-lane.

**Sources that carry weight here**: store listings and their one, three, and five
star reviews, Reddit and public community discussion, developer postmortems,
conference talks, industry analysis, and academic work on simulation and on
difficulty. Vendor marketing pages count as claims by an interested party, and
are labelled opinion.

**A decision-flipping claim in this domain** looks like an estimate of how large
the audience for construction puzzles has been over the last few years, or
whether the strongest competitor is still actively developed. **A colour claim**
looks like which studio originally popularised a mechanic. The first changes the
verdict if wrong. The second does not.

**Provenance in this domain.** Wishlist counts and review totals pulled from a
store listing are `sourced`. A forum thread where players say they would buy a
game like this is `stated`. Players describing the workaround they use because
placement controls are imprecise is `described`. Hours logged on a rough
equivalent, or a paid mod that exists only to fix the missing feature, is
`revealed` - the money is incidental, what counts is that somebody already spent
something. A persona an agent wrote to illustrate the audience is `generated`,
and stays that way however convincing it reads.

**Where the boundary gets crossed in this domain**: "players in this genre
complain most about imprecise placement controls" is a finding. "The game should
use a snap-to-grid placement system" is design, and it does not belong in this
document.
