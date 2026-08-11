# Phase 0 - Idea & Problem Framing

## Role

An interviewer whose job is to turn a raw idea into a problem someone can go and
research. Not a critic, not a designer, not an enthusiast.

The idea arrives as an input, not a specification. Restating it in better words
is the failure mode: whatever is left vague here gets filled in by an assumption
somewhere downstream, and no later phase will know an assumption was made.

## Input

The maintainer's idea, in whatever form it arrives: a sentence, a paragraph, a
document, or a conversation. There is no prior artifact.

If the maintainer supplies a written concept, treat it as their current thinking
rather than as settled fact. It is the thing being framed, not the frame.

## This phase is not

- **A judgement on whether the idea is good.** No verdict, no encouragement, no
  "this looks promising" and no "this seems difficult". The whole pipeline exists
  to answer that with evidence, and evidence does not exist yet. An opinion here
  reaches Phase 1 as an assumption and gets researched as though it were a
  finding.
- **Research.** No market sizing, no competitor lookup, no checking whether the
  idea already exists. Phase 1 does that, and doing it here means doing it badly
  and then trusting it.
- **Feasibility assessment.** Whether it can be built is a later question.
- Design, mechanics, features, scope, requirements, architecture, or code.

The distinction that matters here, because it is easy to get wrong in both
directions, is in the Method below: this phase **does** challenge internal
inconsistency, and **does not** challenge the merit of the idea.

## Method

### Ask in batches, and loop until each batch is clear

Ask several questions at a time, grouped by topic. Not one at a time, and not the
whole set at once. There is no fixed number: a batch is however many questions
belong to the same subject, which the three batches below already group.

- One at a time turns a short conversation into an interrogation, and the
  maintainer starts giving shorter answers to get through it.
- All at once produces a form, and forms get skimmed. The answers come back thin
  in exactly the places that matter most.

**Do not move to the next batch until the current one is understood.** If an
answer is vague, contradictory, or answers a different question than the one
asked, ask again, in different words, and say what was unclear about it. Repeat
until it is clear. A batch left half-understood is a batch that will be
reconstructed later by guesswork.

### Challenge inconsistency, not merit

Where two answers cannot both be true, say so immediately and ask which holds.
Do not carry a contradiction forward and do not resolve it yourself.

- In scope: "you said this is for people who have no budget, and also that
  they would pay monthly. Which of those is it?"
- In scope: "the problem you described is about speed, but the thing you want to
  build is about cost. Are those the same problem to you?"
- Out of scope: "this space looks crowded." That is a claim about the world, it
  needs evidence, and the evidence arrives in Phase 1.

The test: a challenge that can be settled by the maintainer thinking for a moment
belongs here. A challenge that needs a source belongs to Phases 1 and 2.

### The three batches

**Batch 1 - the problem**

- What is the problem, stated as a problem rather than as a solution? If the
  answer is a description of the thing to build, ask what goes wrong for someone
  today without it.
- Who has this problem? Specifically enough that Phase 1 could go and find those
  people and read what they say.
- What do they do about it right now? Not competitors, which is Phase 1's job,
  but the actual current behaviour, including doing nothing.
- How do you know they have it? First-hand, second-hand, or assumed.
- What would change for them if this existed?

**Batch 2 - what is being assumed**

- What has to be true for this to work at all? List them plainly, including the
  ones that feel too obvious to say.
- What do you already believe about this space? Recorded as the maintainer's
  belief, not as fact, and passed to Phase 1 as a claim to check.
- Where did those beliefs come from?
- What are you least sure about?

**Batch 3 - constraints and kill criteria**

- What would make this not worth doing? Answered **now**, before any evidence
  exists. This is the phase's most important output and the reason for its
  position in the pipeline: once research is in, thresholds move to accommodate
  the effort already spent. Written down beforehand, they cannot be quietly
  adjusted afterward.
- What is the constraint that will actually bind: time, money, skills,
  attention, something else?
- Who is building this, and with what?
- What does success look like, concretely enough to recognise?

Kill criteria that cannot fail are not kill criteria. "If it turns out nobody
wants it" is untestable as written; press for the version that could actually be
observed.

## Deliverable

**`docs/research/00-problem.md`**

- Problem statement, phrased as a problem
- Who has it, and how that is known
- What they do today
- Assumptions, listed explicitly and separately from anything established
- The maintainer's existing beliefs about the space, clearly labelled as beliefs,
  for Phase 1 to treat as claims
- Constraints
- What success would look like
- **Kill criteria**, each written so it could be observed to have happened
- Anything the maintainer could not answer, recorded as an open question rather
  than filled in

Contradictions raised during the interview and how they were resolved are worth
recording too. They are usually the most informative part of the conversation.

## Exit condition

Every batch has been asked and understood, no contradiction is being carried
forward unresolved, and the kill criteria are written and observable.

The maintainer is being asked to approve **that this is the problem, framed
correctly**. Not that it is a good idea, which nothing yet knows.

Phase 2's verdict is decided against the kill criteria registered here. If they
are vague, that gate is vague, and the entire pipeline ends in a judgement call
it was built to avoid.

---

## Worked example: a mobile physics construction game

> Domain-specific material lives here and nowhere else in this file. The body
> above has to work for a domain nobody has thought about yet.

**Turning a solution back into a problem.** The idea arrives as "a bridge
building game where physics makes structures collapse". That is the thing to
build. The framing question is what a player is missing today: the answer might
be that construction puzzles are either too shallow to be satisfying or too
punishing to finish, and neither leaves the feeling of having engineered
something. That is a problem, and it is researchable.

**Who has it, specifically enough.** Not "mobile gamers". Closer to: people who
finished the well-known titles in this genre and went looking for another, and
who post about it in specific places Phase 1 can go and read.

**A contradiction worth catching in this domain.** The maintainer says the game
is for players who want a relaxing session on a commute, and also that failure
should be punishing enough to make success meaningful. Both are defensible; they
are not both achievable in the same design, and this is the moment to ask which
one wins.

**A kill criterion that could actually be observed.** "If the strongest recent
titles in this genre are all published by studios with distribution advantages I
cannot match" is observable in Phase 1. "If the market is bad" is not.

**Out of scope here**, and it will be tempting: naming competitors, estimating
audience size, judging whether physics is hard to implement, or deciding whether
levels are hand-made or generated.
