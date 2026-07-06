# Stack & providers

> The internal stack plus every external provider/dependency — role, tier, env var(s),
> data sent, data residency, cost, and link.
> Doubles as the privacy / data-flow map: **check this before sending confidential data
> to any provider.**

## Stack
- language / runtime: <…>
- framework(s): <…>
- datastore: <…>
- hosting: <…>

## External providers
| Provider | Role | Tier/plan | Env var(s) | Data sent | Residency | Cost | Link |
|---|---|---|---|---|---|---|---|
| <ExampleProvider> | <what it does, e.g. email delivery> | <free / pro> | `<EXAMPLE_API_KEY>` | <e.g. recipient address, message body> | <region, e.g. EU> | <e.g. $0 / usage-based> | <url> |

## Data that may leave the box
<Which data goes to which provider — one line each. Example:>
- <user email + message body → ExampleProvider (email delivery)>
- <nothing else leaves the box; keep this list current when a provider is added>
