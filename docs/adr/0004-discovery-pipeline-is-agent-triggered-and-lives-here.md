# 4. The discovery pipeline is agent-triggered, depth-switched, and lives in this repo

- Status: accepted

## Context

projectflow's discovery step (`SKILL.md` §1.0) was a single block: research the
idea, decide go or no-go, then plan. It covered the right ground but compressed
several distinct activities into one, and in practice an agent given that
instruction produces a page of plausible summary and moves on.

Replacing it with a staged pipeline raises three questions that reach beyond any
one phase, and therefore cannot be deferred to the propose step under ADR 0003.
Left unanswered, each one gets re-decided differently in each of the seven phase
prompts.

**Who starts it.** A pipeline the maintainer has to remember to ask for is a
pipeline that runs occasionally. But a pipeline that always runs turns a two-line
bugfix into a research project.

**What it costs.** The deep path fans research out across parallel lanes and
verifies claims adversarially. That is the right spend when deciding whether to
commit months to something, and absurd for a small feature on a system already
understood.

**Where the prompts live.** Either in `templates/`, copied into every
bootstrapped project, or here, invoked through the installed skill.

## Decision

**The agent triggers the pipeline.** When a maintainer opens with a new idea or a
greenfield project, the agent announces the pipeline and starts Phase 0 rather
than converting the idea into issues. It is not waited for as a request. Small or
well-understood work goes straight to the issue loop, and when the agent skips
the pipeline it says so out loud rather than skipping silently.

**Phase 1 asks the maintainer for depth.** Short runs a single compact research
pass by the agent itself; deep runs the multi-lane parallel process. The agent
asks rather than inferring, because the cost difference is large and the
maintainer knows the stakes. Later phases inherit that answer unless overridden.

**The prompts live in `docs/prompts/` in this repo, not in `templates/`.** They
are the method the maintainer invokes through the installed skill, not scaffolding
a new project needs its own copy of. A project gets the pipeline's *outputs* -
research notes, a charter, a PRD - not the instructions that produced them.

## Consequences

- The pipeline runs on its own, which is what makes the per-phase approval gates
  and the greenfield rule real rather than aspirational. It also means a
  mis-triggered pipeline is now possible, so the skip criteria have to be written
  precisely and stated when used.
- Cost is bounded by a question rather than by a rule, which fits a method that
  avoids hard thresholds elsewhere, and puts the judgement on the person who has
  the context to make it.
- Prompts improve in one place and every project gets the improvement at once,
  with no copies to migrate. The cost is that a project cannot pin a version of
  the pipeline the way it can pin a template, and a project's research artifacts
  will not record which version of the prompt produced them.
- The trigger has to be wired into `SKILL.md` and `CLAUDE.md`, since nothing else
  is read at the start of a project. Until that is done, everything decided here
  is inert.
- `SKILL.md` §1.0's "Phase 0 - Discovery & feasibility" now collides with the
  pipeline's Phase 0. The repo has to settle on one Phase 0, and it is the
  pipeline's.
