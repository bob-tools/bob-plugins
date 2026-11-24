# Installing BoB MCP servers (for AI agents)

All three servers are remote: there is nothing to download, build or run locally, and no API key.
Add the URL as a remote MCP server using Streamable HTTP. Authentication is OAuth 2.1 with dynamic
client registration and PKCE: on the first tool call the server answers 401 with a
`WWW-Authenticate` header, and the client opens the BoB sign-in page in the browser.

| Server name | URL | What it is |
|---|---|---|
| `bob-tools` | `https://api.bob.tools/mcp` | BoB Tools — Apps for Business: the user's tables, records, views, dashboards, docs and share links |
| `bob-chat` | `https://chat-mcp.bob.tools` | BoB Chat — the user's own Telegram, through the BoB Chat app on their phone |
| `bob-currency` | `https://mcp-currency.bob.tools` | Currency Rates BoB — exchange rates for 140 currencies; no sign-in needed to start |

## Cline

Add to `cline_mcp_settings.json`:

```json
{
  "mcpServers": {
    "bob-tools": { "type": "streamableHttp", "url": "https://api.bob.tools/mcp" },
    "bob-currency": { "type": "streamableHttp", "url": "https://mcp-currency.bob.tools" }
  }
}
```

Add `bob-chat` the same way only if the user has the BoB Chat app (Android or iPhone) signed in to
Telegram: https://chat.bob.tools/chat/connect/

## Check that it works

- `bob-currency`: call `get_current_rates` — returns rates per 1 USD without sign-in.
- `bob-tools`: call `bob_get_account` — the first call opens sign-in; afterwards it returns the
  user's companies and files. A new account has no files yet: offer to build the first app
  (ask what the team tracks, then create the table with `bob_files` and `bob_fields`).
- `bob-chat`: call `chat_overview` — lists the linked phones and Telegram accounts.

Support: support@bob.tools · Docs: https://bob.tools/mcp/
