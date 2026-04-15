# BOB Tools — Claude Code Plugin Marketplace

Official plugin marketplace for [BOB Tools](https://bob.tools) — AI-powered forms, data management, currency rates, and phone control.

## Quick Start

### 1. Add the marketplace

```bash
/plugin marketplace add ivbar/bob-plugins
```

### 2. Install plugins

```bash
# All-in-one data management (files, records, fields, views, shares, Telegram)
/plugin install bob-tools@ivbar/bob-plugins

# Currency exchange rates (no auth needed)
/plugin install bob-currency@ivbar/bob-plugins

# Remote Android phone control
/plugin install bob-control@ivbar/bob-plugins
```

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

### bob-control

Remote Android phone control via cloud relay (FCM).

| Tool | Description |
|------|-------------|
| `phone_screenshot` | Capture screen as JPEG |
| `phone_get_ui_tree` | Accessibility tree (preferred over screenshots) |
| `phone_tap` / `phone_tap_text` | Tap by coordinates or visible text |
| `phone_swipe` | Swipe gestures |
| `phone_type` | Type text into focused field |
| `phone_press_back/home/recents` | Navigation buttons |
| `phone_get_apps` / `phone_open_app` | App management |
| `phone_get_notifications` | Read/open/dismiss notifications |
| `phone_enable_adb` / `phone_disable_adb` | ADB toggle |
| `phone_list_devices` | List paired devices |

**Auth:** OAuth. Requires [BOB Control](https://play.google.com/store/apps/details?id=tools.bob.control) Android app installed on target device.

## Alternative: Direct MCP Setup

If you prefer adding MCP servers without the plugin system:

```bash
# BOB Tools
claude mcp add --transport http bob-tools https://api.bob.tools/mcp

# Currency Rates
claude mcp add --transport http bob-currency https://api.bob.tools/mcp-currency

# Phone Control
claude mcp add --transport http bob-control https://api.bob.tools/mcp-control
```

## Links

- [bob.tools](https://bob.tools) — Landing page
- [web.bob.tools](https://web.bob.tools) — Web app
- [BOB Control on Google Play](https://play.google.com/store/apps/details?id=tools.bob.control) — Android app for phone control
