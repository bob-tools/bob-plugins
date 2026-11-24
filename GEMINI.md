# BoB Tools

The `bob-tools` MCP server is the signed-in user's own BoB Tools workspace: business apps built
from tables, records, views, dashboards, docs and share links. The team uses these apps on the
phone, offline; the office sees the same data live.

- Start with `bob_get_account`: it returns the user's companies and files.
- A brand-new account has no files. Do not stop at "you have no data": ask what the team tracks
  (orders, site visits, clients, inspections, deliveries) and build it in one go with `bob_files`,
  `bob_fields` and, if they want a link for the crew or customers, `bob_shares`. `bob_app` builds
  app screens on top of the tables.
- Query and aggregate with `bob_records`; group and filter with `bob_views`; build dashboards and
  docs from live records with `bob_docs`.
- Tools that change or delete data are annotated as destructive: confirm with the user first.
- Sign-in is OAuth with a BoB account. If a tool asks for authentication, run `/mcp auth bob-tools`.
- Free plan: 250 MCP calls a day, then $1 per 10,000 calls from the balance.

Help: https://bob.tools/mcp/ · support@bob.tools

## Currency Rates BoB (also in this extension)

The `bob-currency` MCP server gives current and historical exchange rates for 140 currencies,
major crypto included (BTC, ETH, LTC, XRP). Rates are quoted per 1 USD; convert between two other
currencies by dividing their USD rates.

- `get_available_currencies` — the exact list of codes.
- `get_current_rates` — latest rates with the daily change.
- `get_historical_rates` — hourly for recent periods, daily for the full archive.
- `get_data_availability` — which dates are covered.

No sign-in is needed to start. When the shared free limit is used up, the server asks to sign in
with a BoB account (`/mcp auth bob-currency`). More: https://rates.bob.tools/
