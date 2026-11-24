# BoB Chat

The `bob-chat` MCP server connects the user's own Telegram account through the BoB Chat app on
their phone. Each request is relayed to the phone, which runs it and sends the result back.

- Start with `chat_overview`: linked devices, the accounts on each, and what the AI may do
  (read or send, which chat kinds).
- `chat_unread` gives a digest of unread chats; `chat_recent` reads one chat; `chat_list` and
  `chat_search_contacts` find chats. `chat_search_contacts` returns the account and chat ids that
  `chat_send` takes.
- If the phone has not answered yet, poll with `chat_check_command` (free).
- Sending is available only when the user allows it on the phone, and each message waits for
  their tap there unless they turned that off. Always show the draft before sending.
- Sign-in is OAuth with the same BoB account as in the app. If a tool asks for authentication,
  run `/mcp auth bob-chat`. Setup guide: https://chat.bob.tools/chat/connect/
- Free: 30 remote requests a day.
