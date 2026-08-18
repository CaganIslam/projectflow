# Progress log

> The project's memory - what's been done. Newest first.
> **Append an entry after every issue / PR / milestone.** One short bullet block each.

<!-- Template for an entry:

## YYYY-MM-DD — <short title>
- Issue: #N  ·  PR: #M  ·  Milestone: <name>
- What changed: <one or two plain lines>
- Notes for next time: <anything that will save future-you time>
-->

## 2026-08-18 - The riskiest assumption gets named before the charter

- Issue: #39 · Milestone: Milestone 4: Evidence discipline
- What changed: Phase 2 now closes with an assumption inventory sorted into wanted,
  worth it, buildable, and adoptable, ranked by consequence, with a test card for
  the top item whose threshold is written before the test runs. Phase 3 will not
  start until that item is tested or recorded as accepted untested, and a failed
  test goes back to Phase 2. Fifth cross-phase contract in
  `docs/DISCOVERY-PIPELINE.md`, and a gate row between 2 and 3.
- Notes for next time: this started as a proposal for a new phase and was cut down
  on purpose. Two reasons, both in the issue: a test is human work over days, so a
  numbered phase would stall the pipeline in a way no other phase does, and
  inserting one renumbers 3 through 6 across the whole repo for a stage most
  projects skip. Also worth remembering that skipping Phase 3 does not skip the
  gate; the state goes in `BLUEPRINT.md` instead.

## 2026-08-18 - Claims record where they came from

- Issue: #37 · Milestone: Milestone 4: Evidence discipline
- What changed: the claim ledger gained a `provenance` column, owned by
  `docs/prompts/README.md` along with its six values and the threshold between
  `stated` and `described`. Phase 1 refuses ungrounded simulation, marks anything an
  agent produced as `generated`, and cannot label it `fact` or `evidence`. Phase 2
  now separates generated from unverifiable, keeps both stamped in the report, and
  caps a go to a cautious-go when no decision-flipping claim reaches `described`.
- Notes for next time: the trap is reading provenance as "how did you find out".
  It is "what happened" - the `source` column already answers the other question,
  which is why a dataset of hours played counts as `revealed` and a market report
  counts as `sourced`. Also, choosing one of the four ordered values is what marks
  a claim as a demand claim; #38 was closed because any other way of deciding that
  needs a classification pass nothing can do reliably.

## 2026-08-14 - Agent organization for the development stage

- Issue: #18 · Milestone: Milestone 3: Working loop improvements
- What changed: new `SKILL.md` section 3.5, with the core rule mirrored in
  `CLAUDE.md`. Separates parallelism (same work, different items, buys time) from
  role separation (different work, same item, buys quality), states that an agent
  cannot audit its own output, requires parallel agents to carry a different lens or
  an adversarial stance, requires handoff through written artifacts, and says when
  not to split.
- Notes for next time: roles are deliberately not named. A fixed set (implementer,
  reviewer, verifier) starts to look like a framework and does not fit every project;
  the same agent can do both jobs on different issues, and what matters is that it is
  never both on the same issue. The example in the section says exactly that.

## 2026-08-12 - The two missing agent working rules

- Issue: #17 · Milestone: Milestone 3: Working loop improvements
- What changed: two guardrails added to `SKILL.md` section 0 and mirrored in
  `CLAUDE.md`. Stay inside the issue: only the files the issue needs, a necessary
  out-of-scope change named in the proposal rather than slipped in, a worthwhile but
  unnecessary one becoming its own issue. Leave the build green throughout the work,
  not only at the end.
- Notes for next time: most of what people put in an "AI coding rules" document was
  already here - one concern per commit in section 7, tests and verification in
  sections 1 and 6, follow-the-architecture in section 2, decisions as ADRs. Only
  these two were genuinely missing, which is why no new document was created. The
  build rule went to section 0 rather than into the verification step, because that
  step is reached at the end of an issue and the rule is about staying green
  throughout.

## 2026-08-12 - Both gates given a trigger

- Issues: #20, #21 · Milestone: Milestone 3: Working loop improvements
- What changed: the propose gate and the verify gate are now always-on guardrails in
  `SKILL.md` section 0, alongside the two rules that never get skipped, and each has
  an observable trigger: no Edit, Write, or branch on an issue's behalf before an
  approved proposal, and no "done" / "fixed" / "working" / "passing" without the
  supporting output in the same message. Section 1 steps 3 and 4 point at those
  triggers. `CLAUDE.md` mirrors both.
- Notes for next time: two findings worth keeping. First, "a written issue is never a
  proposal" had to be stated outright - our issues are detailed enough that reading
  one feels like the proposing is done, a trap this repo built for itself. Second,
  section 1 step 4 assumed a code repo, so in a docs repo the rule matched nothing
  and got skipped rather than translated; it now says what verification means when
  nothing is runnable.
- Done in one change rather than two because both edits land on the same sections of
  the same files, and two mechanisms for two gates would have been the worse outcome.

## 2026-08-12 - The pipeline is wired in, and Milestone 2 is done

- Issue: #15 · Milestone: Milestone 2: Discovery pipeline
- What changed: `SKILL.md` section 1.0 replaced with the pipeline trigger, an
  eleven-stage table naming what each phase produces and what its gate approves,
  and four rules a phase prompt alone would not convey. Section 0.5's discovery row,
  section 9's step 0, the loop diagram, and the repo contents list updated to match.
  `CLAUDE.md` step 0 and its deep-skill table, and `README.md`, updated too. The
  skill frontmatter description now mentions the pipeline, which is what decides
  whether the skill is invoked at all.
- Notes for next time: the repo now has one Phase 0, the pipeline's. The old section
  1.0 was a single discovery block that used the same name for different work, and
  leaving both would have meant two answers to "what is Phase 0" inside one file.
- Milestone 2 is complete: seven prompts, the contract, the pipeline document, and
  the wiring. Milestone 3 remains: #17, #18, #20, #21, #22.

## 2026-08-12 - The pipeline document

- Issue: #14 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/DISCOVERY-PIPELINE.md`. Stage list, when the pipeline runs
  and when it is skipped, what is being approved at each of the seven gates, the
  four cross-phase contracts, and one paragraph each pointing stages 7 to 10 at
  the SKILL.md sections that already describe them. Plain-text diagram, since the
  main reader is an agent.
- Notes for next time: writing this surfaced a duplication in our own docs.
  `BLUEPRINT.md` was carrying the stage diagram and the contract list, which this
  document now owns, so BLUEPRINT was reduced to a pointer and `ARCHITECTURE.md`'s
  ownership table gained a row. The rule keeps catching us as fast as we write it.

## 2026-08-11 - Phase 6 sprint planning prompt, and the seven prompts are complete

- Issue: #13 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/phase-6-sprint-planning.md`, the last of the seven.
  Uses SKILL.md's existing issue and milestone format rather than a parallel one.
  Deferred decisions arrive as `## Options` and are not collapsed into a
  recommendation. The split follows Phase 5's module boundaries. A coverage check
  maps every PRD screen and feature to an issue and reports anything uncovered.
  Nothing is created until the maintainer approves the drafted set, and priorities
  are proposed rather than assigned.
- Notes for next time: this is where the pipeline either pays off or leaks. The
  coverage check is the reason the PRD was made to enumerate exhaustively, and
  without it a dropped feature looks like a decision nobody made. The phase also
  states its own end explicitly, because a pipeline that trails off leaves the
  agent guessing whether more planning is wanted.
- Still open in Milestone 2: `DISCOVERY-PIPELINE.md` (#14) and the skill wiring
  (#15). Until #15 lands, none of this triggers on its own.

## 2026-08-11 - Phase 5 technical design prompt

- Issue: #12 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/phase-5-technical-design.md`. Cross-cutting
  decisions only, with the deferred-decision list as a required section of
  `ARCHITECTURE.md` rather than a separate file. ADRs written now rather than
  listed for later. Inapplicable sections get one line of reason instead of
  filler, with five sections that can never be skipped. Testing attaches to the
  contract and flow layers SKILL.md section 6 already defines.
- Notes for next time: the phase's real output is what it refuses to decide. A
  design with an empty deferred-decision section has failed, however complete it
  looks, because the issue loop then has nothing left to weigh and the propose
  gate becomes transcription.

## 2026-08-11 - Phase 4 PRD prompt

- Issue: #11 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/phase-4-prd.md`. Every screen and every feature
  enumerated with states and acceptance criteria, traceability written inline on
  each requirement, charter conflicts raised rather than resolved, and the
  what/why versus how boundary written out with its reasoning. Its own file at
  `docs/PRD.md`. The contract table and `BLUEPRINT.md` were updated, since the PRD
  path had been left open for this issue to decide.
- Notes for next time: the word "major" was deliberately banned from the
  enumeration rule. It reads as reasonable and it is the mechanism by which a
  feature quietly never gets built: skipped here, never an issue in Phase 6, and
  nobody notices a decision was made.

## 2026-08-11 - Phase 3 product charter prompt

- Issue: #16 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/phase-3-product-charter.md`. Three to five pillars,
  each with a violation clause and a stated basis. Quality goals must name what
  they beat and what beats them. Anti-goals written last so they derive from the
  pillars. Amendments go through an ADR. Its own file at `docs/CHARTER.md`, and
  the phase is skippable for projects with no identity to protect, provided the
  skip is stated.
- Notes for next time: the admission test is what keeps this from becoming a
  second PRD - every section has to answer "what does this forbid", and a section
  that rules nothing out gets deleted. The pillar count matters more than it
  looks: with ten pillars, any proposal that conflicts with one can be defended by
  appealing to another.

## 2026-08-11 - Phase 2 validation and red team prompt

- Issue: #10 · Milestone: Milestone 2: Discovery pipeline
- What changed: `docs/prompts/phase-2-concept-validation.md`. Three ordered passes:
  adversarial verification down the claim ledger, then isolated red team panels
  with a two-way devil's advocate, then a verdict decided against the Phase 0 kill
  criteria. Quarantined claims stay in the report stamped rather than being
  deleted. A maintainer override is argued against and offered alternatives first,
  then recorded with its reason.
- Notes for next time: the design problem here is that nine panels told to prove
  failure always produce a long list, so a verdict read off the weight of that list
  kills everything. Fixing it is what the pre-registered kill criteria are for, and
  it is why Phase 0's most important output is a set of criteria written before any
  evidence exists. The other trap is the exit condition of the verification loop:
  "no source errors" cannot terminate, because some claims are permanently
  unverifiable and unverifiable is not wrong.

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
