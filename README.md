# BOB Tools — Plugin Marketplace

Official plugin marketplace for [BOB Tools](https://bob.tools) — AI-powered forms, data management, currency rates, and Telegram control.

Works in both **Claude Code** (`.claude-plugin/marketplace.json`) and **Codex** (`.agents/plugins/marketplace.json`) from the same repo.

## Quick Start (Claude Code)

### 1. Add the marketplace

```bash
/plugin marketplace add bob-tools/bob-plugins
```

### 2. Install plugins

```bash
# All-in-one data management (files, records, fields, views, shares, Telegram)
/plugin install bob-tools@bob-tools/bob-plugins

# Currency exchange rates (no auth needed)
/plugin install bob-currency@bob-tools/bob-plugins

# Remote Telegram control via your phone
/plugin install bob-chat@bob-tools/bob-plugins
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

Then install `bob-chat`, `bob-tools`, or `bob-currency` from the list. All use HTTP transport with OAuth on first connection.

## Available Plugins

### bob-tools

Full BOB Tools integration — 70+ MCP tools for managing your data.

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

### bob-currency

Current and historical exchange rates for 178+ currencies.

| Tool | Description |
|------|-------------|
| `get_available_currencies` | List all supported currencies |
| `get_current_rates` | Current rates with daily change % |
| `get_historical_rates` | Hourly or daily aggregated history |
| `get_data_availability` | Check data date ranges |

**Auth:** None — public access.

### bob-chat

Remote Telegram control via cloud relay (FCM) — runs entirely on your phone, no chat data stored server-side.

| Tool | Description |
|------|-------------|
| `chat_list_devices` | List linked BOB Chat devices and their Telegram accounts |
| `chat_list_accounts` | List Telegram accounts signed in across devices |
| `chat_search_contacts` | Resolve a name/@handle to writable chats across accounts |
| `chat_search_messages` | Semantic search over incoming messages |
| `chat_unread` | Digest of chats with unread incoming messages (channels excluded) |
| `chat_recent` | Most recent messages from one chat |
| `chat_send` | Send a text message to a chat |
| `chat_mark_read` | Mark all unread incoming messages in a chat as read |
| `chat_check_command` | Check the result of an async chat command |

**Auth:** OAuth. Requires the BOB Chat app installed and signed in on the target phone.

## Alternative: Direct MCP Setup

If you prefer adding MCP servers without the plugin system:

```bash
# BOB Tools
claude mcp add --transport http bob-tools https://api.bob.tools/mcp

# Currency Rates
claude mcp add --transport http bob-currency https://api.bob.tools/mcp-currency

# Telegram Control
claude mcp add --transport http bob-chat https://api.bob.tools/mcp-chat
```

## Links

- [bob.tools](https://bob.tools) — Landing page
- [web.bob.tools](https://web.bob.tools) — Web app
