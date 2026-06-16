# 1. Area vocabulary is configurable, not hard-coded

- Status: accepted

## Context
The method was extracted from a project whose layers were frontend / backend / mobile
/ devops. Baking those names into the skill would make it useless for projects with
different layers (e.g. api / web / infra).

## Decision
The **area** axis is configuration, not content. The skill, templates, commitlint
config, and bootstrap script all read the area vocabulary from one place
(`CLAUDE.md` → Configuration / the `AREAS` env in the bootstrap). The default set is
provided as an example only.

## Consequences
- The skill drops into any project by editing one list.
- Labels, title prefixes, branch scopes, and commit scopes all stay in sync because
  they derive from the same vocabulary.
