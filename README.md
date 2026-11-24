# BoB Tools — Plugin Marketplace

Plugin marketplace for [BoB Tools](https://bob.tools) — Apps for Business: your team's data apps, currency rates, Telegram chats and Android phone control.

Works in **Claude Code** (`.claude-plugin/marketplace.json`), **Codex** (`.agents/plugins/marketplace.json`), **Cursor** (`.cursor-plugin/marketplace.json`), **Antigravity** and other Agent Plugins clients (`plugins/*/plugin.json` + `mcp.json`) and **Gemini CLI** (`gemini-extension.json`) from the same repo.

## Quick Start (Claude Code)

### 1. Add the marketplace

```bash
/plugin marketplace add bob-tools/bob-plugins
```

### 2. Install plugins

```bash
# All-in-one data management (files, records, fields, views, shares, Telegram)
/plugin install bob-tools@bob-plugins

# Currency exchange rates (works without sign-in)
/plugin install bob-currency@bob-plugins

# Remote Telegram control via your phone
/plugin install bob-chat@bob-plugins

# Remote Android phone control via your phone
/plugin install bob-control@bob-plugins
```

## Quick Start (Codex)

In the Codex app: **Plugins → Add plugin marketplace**, then:

| Field | Value |
|-------|-------|
| **Source** | `bob-tools/bob-plugins` |
| **Git ref** | `main` |
| **Sparse paths** | *(leave empty)* |

Or via CLI:

```bash
codex plugin marketplace add bob-tools/bob-plugins
```

Then install `bob-chat`, `bob-tools`, `bob-currency`, or `bob-control` from the list. All use HTTP transport with OAuth on first connection.

## Quick Start (Antigravity)

```bash
git clone https://github.com/bob-tools/bob-plugins
agy plugin install ./bob-plugins/plugins/bob-tools      # or bob-chat, bob-currency
```

Each plugin folder is an [Agent Plugin](https://agent-plugins.org) (`plugin.json` + `mcp.json`), so the
same folders also work in Cursor (`.cursor-plugin/marketplace.json` lists them) and other Agent Plugins
clients. Sign in when the client asks: open `/plugin`, expand the plugin and choose **Sign in**.

## Quick Start (Gemini CLI)

```bash
# BoB Tools + Currency Rates BoB in one extension
gemini extensions install https://github.com/bob-tools/bob-plugins

# or one product at a time, from a local clone
gemini extensions install ./bob-plugins/plugins/bob-chat
```

Then run `/mcp auth bob-tools` (or `bob-chat`) once to sign in. Currency Rates BoB works without sign-in.

## Any other MCP client (VS Code, Cline, Windsurf, Zed …)

Add a remote (Streamable HTTP) server with one of these URLs. The client opens the BoB sign-in page
on first use (OAuth 2.1 with dynamic client registration):

| Product | URL | Sign-in |
|---|---|---|
| BoB Tools — Apps for Business | `https://api.bob.tools/mcp` | BoB account |
| BoB Chat — Connect Telegram to your AI | `https://chat-mcp.bob.tools` | BoB account + the BoB Chat phone app |
| Currency Rates BoB | `https://mcp-currency.bob.tools` | not needed to start |

VS Code `mcp.json`:

```json
{ "servers": { "bob-tools": { "type": "http", "url": "https://api.bob.tools/mcp" } } }
```

Step-by-step for AI agents installing this: [llms-install.md](llms-install.md).

## Available Plugins

### bob-tools

BoB Tools — Apps for Business. Build and run your team's apps from your AI: tables, records, dashboards, docs and share links.

| Category | Tools |
|----------|-------|
| Files | Create, list, update, delete, move files and folders |
| Records | Query with filters (BigQuery), aggregate, batch update/delete, history |
| Fields | Add, update, delete fields; get unique values; formula fields |
| Views | Table views, dashboards with chart/counter widgets |
| Shares | Public/group share links, PIN protection, expiration |
| Images | Upload, attach to records, AI extraction |
| Actions | Conditional field visibility rules |
| Company | Create companies, invite users, manage AI prompts (admin) |
| Integrations | Bitrix24, Telegram Business (admin) |
| Imports | Async data import from Bitrix24 (admin) |
| Telegram | Customer chats, send messages, AI auto-reply |

**Auth:** OAuth — opens automatically on first tool call.

**Quota:** the free plan includes 250 MCP calls a day, then $1 per 10,000 calls from your balance; BoB Pro / Max are unlimited.

### bob-currency

Current and historical exchange rates for 140+ currencies.

| Tool | Description |
|------|-------------|
| `get_available_currencies` | List all supported currencies |
| `get_current_rates` | Current rates with daily change % |
| `get_historical_rates` | Hourly or daily aggregated history |
| `get_data_availability` | Check data date ranges |

**Auth:** None — public access, no quota.

### bob-chat

Remote Telegram control via cloud relay (FCM) — the commands run on your phone or Mac, up to 4 accounts per device. Relay results are kept on the server for 7 days, then deleted.

| Tool | Description |
|------|-------------|
| `chat_overview` | Start here: linked devices, the accounts on each, and what MCP may do with them (read / send, chat kinds) |
| `chat_unread` | Digest of chats with unread incoming messages across every account MCP may read |
| `chat_list` | List all chats, most recent first, filterable by type or account, with pagination |
| `chat_recent` | Messages from one chat, pulled live: the unread run by default, or the latest tail |
| `chat_search_contacts` | Resolve a name/@handle to writable chats across all accounts |
| `chat_search_messages` | Full-text search across chat history (Telegram's server-side word search, not semantic) |
| `chat_send` | Send a text message to a chat (offered only when a device allows sending) |
| `chat_mark_read` | Mark all unread incoming messages in a chat as read |
| `chat_check_command` | Fetch the result of a command the phone has not answered yet (polling is free) |

**Auth:** OAuth. Requires the BoB Chat app (Android / iOS / macOS) signed in to Telegram and linked to your bob.tools account; setup guide: https://chat.bob.tools/chat/connect/

**Quota:** the free plan includes 30 remote requests a day; BoB Chat Pro / BoB Max are unlimited.

### bob-control

Remote Android phone control via cloud relay (FCM) — commands run on your phone through the BoB Control app, nothing is executed server-side.

| Tool | Description |
|------|-------------|
| `phone_list_devices` | List linked Android devices |
| `phone_generate_pairing_code` | Generate a 6-digit code to link a new device |
| `phone_screen` | Read the screen — active app + UI tree, optional JPEG screenshot |
| `phone_tap` / `phone_tap_text` | Tap by coordinates, or by on-screen text/description |
| `phone_swipe` | Swipe from one point to another |
| `phone_type` | Type into the focused input |
| `phone_press_back` / `phone_press_home` / `phone_press_recents` | Hardware navigation buttons |
| `phone_get_apps` / `phone_open_app` | List installed apps and open one by package |
| `phone_get_notifications` | List active notifications |
| `phone_open_notification` / `phone_dismiss_notification` / `phone_dismiss_all_notifications` | Manage notifications |
| `phone_unlock_device` | Release the device lock |
| `phone_enable_adb` / `phone_disable_adb` | Toggle the on-device ADB server |
| `phone_check_command` | Check the result of an async control command |

**Auth:** OAuth. Requires the [BoB Control](https://bob.tools) Android app installed and running on the target device.

**Quota:** the free plan includes 250 MCP calls a day, then $1 per 10,000 calls from your balance; BoB Pro / Max are unlimited.

## Alternative: Direct MCP Setup

If you prefer adding MCP servers without the plugin system:

```bash
# BoB Tools
claude mcp add --transport http bob-tools https://api.bob.tools/mcp

# Currency Rates
claude mcp add --transport http bob-currency https://mcp-currency.bob.tools

# Telegram Control
claude mcp add --transport http bob-chat https://chat-mcp.bob.tools

# Android Phone Control
claude mcp add --transport http bob-control https://api.bob.tools/mcp-control
```

## Claude Desktop bundle (`.mcpb`)

For one-click install in Claude Desktop (no plugin system / no terminal), grab the bundle and double-click it:

**[plugins/bob-chat/bob-chat.mcpb](plugins/bob-chat/bob-chat.mcpb)** — direct link: `https://github.com/bob-tools/bob-plugins/raw/main/plugins/bob-chat/bob-chat.mcpb`

This is the single canonical copy — the bob.tools site links straight to it, so there's no duplicate to drift. It's a thin stdio relay to `https://chat-mcp.bob.tools`; source lives in `bob-chat-common/bob-chat-mcp/` (rebuild with `npm run bundle`, then copy the artifact here).

## Links

- [bob.tools](https://bob.tools) — Landing page
- [web.bob.tools](https://web.bob.tools) — Web app
