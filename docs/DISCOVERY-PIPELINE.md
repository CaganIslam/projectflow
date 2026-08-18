# The discovery pipeline

Eleven stages carrying a raw idea from "I have an idea" to a working backlog, and
then through building it.

The first seven have agent prompts in `docs/prompts/`. The last four are the
issue loop `SKILL.md` already describes, and this document points at them rather
than describing them again. Two accounts of one loop drift apart, and then
neither can be trusted.

```
0  Idea & Problem Framing         prompt   kill criteria registered here
1  Exhaustive Research            prompt   short/deep switch, claim ledger
                                           + opportunity and white-space map
2  Concept Validation / Red Team  prompt   verification loop, then attack
                                           -> GO / CAUTIOUS-GO / NO-GO
3  Product Charter                prompt   the invariants  (games: Design Bible)
4  PRD                            prompt   requirements, scope, metrics
5  Technical Design               prompt   cross-cutting decisions only
6  Sprint Planning                prompt   -> issues are created here
--------------------------- handoff ---------------------------
7  Development     -> SKILL.md section 1, the issue loop
8  User Testing    -> SKILL.md section 6 QA + section 5 bug hunt
9  Iterate         -> back to 7, with a defined exit condition
10 Launch          -> SKILL.md section 8, deploy gating
```

## When it runs, and when it does not

**It runs** for a new project, or for greenfield work whose problem space is not
already understood.

**It does not run** for a bugfix, a small change to an existing system, or
anything where "should we, and what already exists" is already answered. That
work goes straight to the issue loop.

The pipeline is expensive. The deep research path fans out across parallel lanes
and the validation phase verifies claims adversarially, which is the right spend
when deciding whether to commit months to something and absurd for a two-day
feature. It exists for a commitment decision, not for every piece of work.

**When it is skipped, the agent says so.** A skipped phase and a forgotten phase
must not look the same.

## The gates

Every phase produces an artifact, the maintainer reads it, and the next phase
starts on their word. There is no phase that flows into the next automatically.

What is being approved differs at each gate, and the prompts name it:

| After | The maintainer is approving |
|---|---|
| 0 | that this is the problem, framed correctly |
| 1 | that the research is complete enough to be attacked |
| 2 | the verdict, and on a cautious-go, its conditions |
| 2 to 3 | the top assumption: its test result, or that it is accepted untested |
| 3 | what must remain true about the product |
| 4 | what will be built and what will not |
| 5 | the shape of the system, and what was left open |
| 6 | the plan and the order of work |

Phase 2 is the one that can end the pipeline. A no-go there is a good outcome: it
costs days rather than months.

The gate between 2 and 3 is the only one that is not the end of a phase. It is
there because everything up to that point is done at a distance, and it is the
last cheap moment to find out whether the thing anyone actually needed was true.
Both of its answers are valid, including accepting the assumption untested; what
it refuses is passing through without the question being asked.

## The contracts between phases

Five contracts run between non-adjacent phases. None is visible from the order
above, and breaking one degrades the pipeline quietly rather than loudly, which
is why they are written down.

**Phase 0's kill criteria decide Phase 2's verdict.** They are registered before
any evidence exists, because thresholds move once effort has been spent. Vague
criteria make the verdict a judgement call, which is what the gate was built to
avoid.

**Phase 1's claim ledger feeds Phase 2's verification loop.** Every claim is
tiered as it is written, so verification spends its effort where a wrong answer
would change the decision. Without the ledger, Phase 2 would have to classify
several hundred sentences itself and would silently skip whatever it misread.

Every claim also records **where it came from**, on the same write-time principle:
whether an agent produced it, a document states it, or somebody was observed doing
something. Phase 2 reads that to tell an invented sentence apart from a genuinely
unverifiable one, and to cap a verdict resting on nothing anyone acted on. The
column is set once, at writing, because provenance cannot be recovered from a
finished page.

**Phase 2's assumption inventory opens Phase 3.** The verdict says whether to
proceed; the inventory says what the decision is standing on, sorted into wanted,
worth it, buildable, and adoptable. Phase 3 does not start until the top item is
tested or recorded as accepted untested, and a failed test goes back to Phase 2
rather than forward. Without this the pipeline validates ideas only by argument,
and an assumption nobody has evidence about survives every panel intact.

**Phase 3's charter is referenced by Phase 4, never restated.** Vision, pillars,
and permanent non-goals live in the charter. The PRD owns requirements, scope,
and metrics. Duplication guarantees drift.

**Phase 5's module boundaries decide Phase 6's split.** What the technical design
marks independent is what can run in parallel. Guessing at the seams instead
surfaces later as merge conflicts, at which point the cause is hard to see.

## Where each phase writes

The artifact paths are in `docs/prompts/README.md`, which owns that table. They
are not repeated here.

## The handoff, stages 7 to 10

After Phase 6 the pipeline is over and projectflow's normal method applies. These
four stages are named so the whole arc is visible, not because they need their
own definitions.

**7 - Development.** The issue loop: `SKILL.md` section 1. One issue at a time,
propose, approve, implement, verify. The `## Options` blocks Phase 6 wrote are
decided here, at propose time, with the code in front of whoever picks up the
issue.

**8 - User Testing.** `SKILL.md` section 6 for the QA track, section 5 for the bug
hunt. Findings become `bug` issues and flow through the normal loop. In a games
project this stage is playtesting; the generic name is what the method uses,
since a service, a tool, and a game all need it and only one of them calls it
playtesting.

**9 - Iterate.** Not a stage so much as a return arrow: findings from stage 8
become issues and go back through stage 7.

Drawn as a list it reads as "iterate once, then launch", which is why it needs an
**exit condition** written before iteration starts. Something like: no unresolved
critical bugs, the charter's necessary conditions hold, and the PRD's acceptance
criteria pass. Without one, iteration either runs forever or stops arbitrarily,
and both feel like judgement at the time.

**10 - Launch.** `SKILL.md` section 8: build first so a failure never touches the
running stack, cut over, smoke test the live URL, and keep destructive operations
behind a separate confirm-guarded path.

## What this document is not

It does not restate the issue loop, the QA track, the bug hunt, or deploy gating.
Those belong to `SKILL.md`. It does not restate any phase's instructions; those
belong to the individual prompts. It does not carry the artifact path table,
which belongs to the prompt contract.

If something here begins to duplicate one of those, the duplicate is the error.
