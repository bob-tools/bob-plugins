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
