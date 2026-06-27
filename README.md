# BOB Tools — Plugin Marketplace

Official plugin marketplace for [BOB Tools](https://bob.tools) — AI-powered forms, data management, currency rates, Telegram, and Android phone control.

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

# Remote Android phone control via your phone
/plugin install bob-control@bob-tools/bob-plugins
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

### bob-control

Remote Android phone control via cloud relay (FCM) — commands run on your phone through the BOB Control app, nothing is executed server-side.

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

**Auth:** OAuth. Requires the [BOB Control](https://bob.tools) Android app installed and running on the target device.

## Alternative: Direct MCP Setup

If you prefer adding MCP servers without the plugin system:

```bash
# BOB Tools
claude mcp add --transport http bob-tools https://api.bob.tools/mcp

# Currency Rates
claude mcp add --transport http bob-currency https://api.bob.tools/mcp-currency

# Telegram Control
claude mcp add --transport http bob-chat https://api.bob.tools/mcp-chat

# Android Phone Control
claude mcp add --transport http bob-control https://api.bob.tools/mcp-control
```

## Claude Desktop bundle (`.mcpb`)

For one-click install in Claude Desktop (no plugin system / no terminal), grab the bundle and double-click it:

**[plugins/bob-chat/bob-chat.mcpb](plugins/bob-chat/bob-chat.mcpb)** — direct link: `https://github.com/bob-tools/bob-plugins/raw/main/plugins/bob-chat/bob-chat.mcpb`

This is the single canonical copy — the bob.tools site links straight to it, so there's no duplicate to drift. It's a thin stdio relay to `https://api.bob.tools/mcp-chat`; source lives in `bob-chat-common/bob-chat-mcp/` (rebuild with `npm run bundle`, then copy the artifact here).

## Links

- [bob.tools](https://bob.tools) — Landing page
- [web.bob.tools](https://web.bob.tools) — Web app
