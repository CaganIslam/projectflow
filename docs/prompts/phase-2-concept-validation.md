# Phase 2 - Concept Validation / Red Team

## Role

An independent review body deciding whether this project deserves to be built.
Not a teammate, not a collaborator, and not trying to make the maintainer feel
good about the idea.

Concluding that the idea should be abandoned, substantially changed, or pivoted
is a permitted outcome and, where the evidence supports it, the correct one. Do
not defend the idea because it exists, and do not protect anyone's feelings. An
idea that survives an honest attempt to kill it is worth more than one that was
never attacked.

## Input

- `docs/research/01-research.md` - the Phase 1 report
- `docs/research/01-claims.md` - the claim ledger: id, claim, tier, label,
  provenance, source, where. The provenance values and what they mean are in
  `docs/prompts/README.md`.
- `docs/research/00-problem.md` - the Phase 0 framing, and specifically the
  **kill criteria** registered there before any evidence existed. The verdict is
  decided against them.

The research report is **not** the source of truth on arrival. It is sourced and
labelled, which is not the same as checked. It becomes usable after Pass 1.

## This phase is not

- **Redesign.** The near miss, and the one this phase violates. Finding a
  weakness and proposing how to fix it is design work three phases early.
  Name the weakness, rank it, and stop.
- **Pivot design.** Pivot *directions* may be named. A pivot may not be worked
  out here.
- **New primary research.** Verification looks up what is already claimed. It
  does not open new lines of enquiry; if the report has a hole, that is a
  finding, not an assignment.
- A PRD, requirements, architecture, or code.
- Rewriting the Phase 1 report wholesale. See Pass 1 on surgical repair.

## Method

Three passes, in this order. The order is the point: attacking unverified numbers
means winning arguments against things that were never true, and killing a sound
idea for a fake reason.

### Pass 1 - adversarial source verification

Run by agents that did not write the research. Their instruction is to **refute**,
not to check, and their default answer under uncertainty is "unverified". An
agent asked to check its own work agrees with it, because the blind spot that
produced the error is still there.

Work down the claim ledger. Effort follows the tier:

| Tier | Treatment |
|---|---|
| decision-flipping | full adversarial check. Must resolve to verified, corrected, or unverified. |
| supporting | does the cited source exist and does it say this? |
| colour | no check. Carried with its label. |

**A `generated` claim is not an unverified one.** Unverified means a source was
sought and nothing settled it. Generated means nobody ever observed the thing:
there is no source to fail to find. Treating the two the same lets an agent's own
output sit in the report stamped as merely hard to confirm.

So a `generated` row is worked differently. The verifier looks for real support
for what it asserts, and one of two things happens:

- support is found, the claim is rewritten to say what the source says, and the
  provenance moves up the ladder to whatever the support actually is;
- nothing is found, and the row stays `generated`, stamped *agent-produced - not
  a basis for decisions*, in the same section as the quarantined claims and
  distinguished from them by its stamp.

A `generated` row is never promoted for being plausible, for surviving an attack,
or for agreeing with the rest of the report. Nothing about it changes except by
finding something real.

**Repair is surgical.** A wrong figure is corrected in place and its confidence
updated. The report is not regenerated. Regeneration discards everything that was
correct and re-rolls fresh errors, and it costs more than the fix.

**Three termination brakes, all of them active:**

- a hard cap of three rounds;
- convergence: a round that surfaces no *new* errors ends the loop;
- quarantine: a claim that fails verification twice is not attempted a third
  time.

**"No source errors" is never the exit condition.** Some claims are permanently
unverifiable: a private company's revenue, a withdrawn product's install count, a
decision made inside someone else's organisation. Unverifiable is not the same as
wrong. Making zero errors the exit makes the loop non-terminating by
construction, which is why the brakes above do not include it.

**Quarantined claims stay in the report**, in their own section, stamped
*unverified - not a basis for decisions*. They are not deleted. What could not be
established is itself information, and a report that quietly drops it reads as
though the question was never asked.

Pass 1 ends with the ledger updated: every row verified, corrected, quarantined,
or left `generated`, with the count of each stated plainly, and with the
decision-flipping rows counted separately by provenance.

### Pass 2 - red team the concept

Runs on the verified report only.

**Independent panels.** Each attacks one axis. Each writes its own report. **No
panel sees another's conclusions until every panel has finished.** Then a
structured debate, and only then the verdict. Panels are expected to disagree,
and disagreement is explained rather than resolved into consensus.

Generic panel set, present in every domain:

| Panel | Tries to establish |
|---|---|
| Value | the thing is not actually useful, or not useful enough to change behaviour |
| Market and demand | too few people want this, or not enough to matter |
| Competition | someone already does this better, or will |
| Repeat use | people try it once and do not come back |
| Business model | it cannot pay for itself |
| Technical risk | the hard part is harder than assumed |
| Delivery and scope | it cannot be built by these people with these constraints |
| User psychology | the intended feeling does not happen |
| Differentiation | it is indistinguishable from what exists |

Plus domain panels the project defines.

**Devil's advocate.** One reviewer whose only job is to argue against whatever the
majority concluded, in either direction. If every panel likes it, they explain why
everyone is wrong. If every panel condemns it, the same in reverse.

**Every criticism carries** evidence, reasoning, confidence, severity,
probability, impact, and a mitigation, or an explicit statement that no mitigation
exists.

**Attacks resting on unverified, quarantined, or `generated` claims are marked as
such and cannot on their own produce a no-go.** Without this rule, Pass 1's
honesty becomes ammunition for killing a sound idea, and an agent's own invented
sentence gets to end the project.

**Stress tests.** Re-evaluate the concept under adverse conditions: acquisition
cost doubles, retention lands well below expectation, the distribution channel
never opens, a competitor ships first, the builder is one person, the runway is
short. Domain-specific scenarios extend this list rather than replacing it.

**Success conditions**, separated into necessary, helpful, and irrelevant. The
necessary ones carry forward into Phase 3 as standing constraints.

### Pass 3 - the verdict

Nine panels instructed to prove failure will always produce a long list of flaws.
If the verdict is read off how heavy that list feels, every idea dies and the
phase is exactly as useless as one that rubber-stamps. So the decision is made
against criteria fixed before the evidence arrived:

- **No-go** if a kill criterion registered in Phase 0 is now met, or if a
  Critical flaw at high confidence has no mitigation.
- **Cautious-go** otherwise, carrying its conditions explicitly.
- **Go** when neither a kill criterion nor an unmitigated critical flaw survives.

**A red team that fails to kill the idea is a go.** A survived attack is not an
unfinished one, and the prompt says so because the instinct at this point is to
keep attacking until something sticks.

**A go cannot rest on claims nobody acted on.** This is the one cap on the rule
above, and it is about what the research established rather than how the attack
went. Read the decision-flipping rows by provenance. If all of them sit at
`generated` or `stated`, the strongest thing established is that the idea sounds
reasonable, which is not the same as anybody wanting it. The verdict drops one
level, a go becoming a cautious-go, and names the rung that is missing and what
would reach it.

This is not a fourth verdict and it does not override the kill criteria. A no-go
stays a no-go. It exists because the failure it catches is invisible: research
built entirely on stated intention and agent output reads exactly like research
built on observed behaviour, and by Phase 3 nobody is looking any more.

**If the maintainer wants to override a no-go**, do not simply accept it. Name
which kill criterion is being set aside and what the evidence for it is, and make
the case once, properly. Then offer alternatives rather than only resistance:
narrow the scope to avoid the failure, pivot in one of the directions Pass 2
named, or find the cheapest test that would settle the disputed assumption before
committing. If the maintainer still wants to proceed, that is their call and it
proceeds, recorded in `BLUEPRINT.md` with the criterion overridden and the reason
given. An override taken silently makes the Phase 0 kill criteria decorative.

## Deliverable

**`docs/research/02-validation.md`**

- Executive summary
- Verification results: counts of verified, corrected, quarantined, and
  `generated`, and what the corrections changed
- The decision-flipping rows counted by provenance, and where the strongest of
  them sits on the ladder
- Quarantined and `generated` claims, each stamped, in their own section
- One section per panel, isolated reports as written
- The devil's advocate position
- The debate: where panels disagreed and what would settle it
- Strongest arguments against, ranked, each with its evidence
- Arguments for, held to the same standard
- Risk matrix and weakness ranking
- Fatal flaws, or an explicit statement that none were found
- Success conditions: necessary, helpful, irrelevant
- Pivot directions, named and not designed
- Kill criteria, each marked met or not met
- Verdict, its reasoning, and an overall confidence score

**`docs/research/01-claims.md`** is updated in place with each row's outcome.

**`BLUEPRINT.md`** receives the verdict, its one-line rationale, a link to this
document, and any override with its reason.

## Exit condition

The ledger is fully resolved, every panel has reported, the debate has happened,
and the verdict is written against the Phase 0 kill criteria rather than against
the weight of the criticism. Where the verdict was capped because no
decision-flipping claim reached `described`, that is stated in the verdict itself
and not only in the counts.

The maintainer is being asked to approve **the verdict, and on a cautious-go, the
conditions attached to it**. On a no-go this is where the pipeline stops, and
stopping here is a good outcome: it costs days rather than months.

---

## Worked example: a mobile physics construction game

> Domain-specific material lives here and nowhere else in this file. The body
> above has to work for a domain nobody has thought about yet.

**Domain panels** alongside the generic set: physics and control feel, whether
the simulation frustrates rather than challenges; content economics, whether
levels can be produced at the rate the design assumes; store discovery, whether
the game is reachable without a featuring slot.

**A permanently unverifiable claim in this domain**: the revenue of a
privately-held studio's title. Estimates from aggregators are themselves claims by
interested parties. This is quarantine material, not a research failure.

**A criticism that rests on a quarantined claim**: "the market leader earns enough
to outspend any newcomer on acquisition" built on an unverified revenue estimate.
Marked as such, it can inform the discussion and cannot produce a no-go alone.

**A stress test specific here**: the game is never featured on a store front page,
and no creator makes a video about it. If the plan only works with either, that is
a necessary condition rather than a hope, and it belongs in the charter.

**Where the phase gets crossed in this domain**: "players in this genre abandon
games when failure feels arbitrary" is a finding, ranked and evidenced. "Add an
undo button and a ghost preview" is redesign, and it belongs three phases later.
