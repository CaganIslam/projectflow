# Architecture & conventions

> Constraints, structure, and the patterns/methods this project uses.
> **Read before writing code** — follow what's here instead of inventing new ways.
> When a structural decision changes, record an ADR in `docs/adr/` and update this file.

## Folder structure
```
<top-level layout: where frontend / backend / mobile / infra live>
```

## Patterns & methods we use
- **State / data:** <e.g. how data flows, the serializer/contract approach>
- **API:** <conventions for endpoints, request/response shapes>
- **Error handling:** <the agreed approach>
- **Naming:** <files, components, branches>
- **Tests:** <unit where, contract suite asserts status+shape+field-names only, flow suite for journeys>

## Constraints (the "always / never" list)
- Always: <…>
- Never: <…>

## Tooling
- commit/PR grammar: `<type>(<area>): subject` (see `commitlint.config.js`)
- areas: `<frontend, backend, mobile, devops>`
- CI: <test workflow>, deploy gated by a smoke test
- destructive ops (DB seed/wipe): isolated, confirm-guarded

## Decisions
See `docs/adr/` for the rationale behind structural choices.
