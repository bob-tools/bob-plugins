# Currency Rates BoB

The `bob-currency` MCP server gives current and historical exchange rates for 140 currencies,
major crypto included (BTC, ETH, LTC, XRP). Rates are quoted per 1 USD; convert between two other
currencies by dividing their USD rates.

- `get_available_currencies` — the exact list of codes.
- `get_current_rates` — latest rates with the daily change.
- `get_historical_rates` — hourly for recent periods, daily for the full archive.
- `get_data_availability` — which dates are covered.

No sign-in is needed to start. When the shared free limit is used up, the server asks to sign in
with a BoB account (`/mcp auth bob-currency`). More: https://rates.bob.tools/
