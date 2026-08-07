# Stack & providers

> The internal stack plus every external provider/dependency - role, tier, env var(s),
> data sent, data residency, cost, and link.
> Doubles as the privacy / data-flow map: **check this before sending confidential data
> to any provider.**

## Stack

- language / runtime: none. Markdown and YAML documents, plus one POSIX shell script
  (`scripts/bootstrap-repo.sh`).
- framework(s): none.
- datastore: none.
- hosting: none. Nothing is built, served, or deployed.
- dev dependency: `commitlint.config.js` declares the commit grammar. No hook is
  installed in this repo, so it currently documents the grammar rather than
  enforcing it.

## External providers

| Provider | Role | Tier/plan | Env var(s) | Data sent | Residency | Cost | Link |
|---|---|---|---|---|---|---|---|
| GitHub | repository hosting, issues, milestones, PRs | free | none stored in-repo; `gh` uses its own auth | repository contents and issue/PR text, all of it public | GitHub-managed, US | $0 | https://github.com/CaganIslam/projectflow |

That is the complete list. There is no analytics, no telemetry, no build service, no
package registry account, and no secret in this repo.

## Data that may leave the box

- Repository contents and issue/PR text go to GitHub, and the repository is public,
  so everything committed here is public by definition.
- Nothing else leaves the box.

Keep this list current when a provider is added. The point of the file is that the
answer to "where does this data go" is written down before it is needed, not after.
