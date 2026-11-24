#!/usr/bin/env bash
# Builds the ChatGPT plugin ZIP for upload at https://platform.openai.com/plugins
# Usage: scripts/build-chatgpt-zip.sh [plugin]   (bob-tools by default, or bob-chat) -> dist/<plugin>-chatgpt-<version>.zip
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NAME="${1:-bob-tools}"
SRC="$ROOT/chatgpt/$NAME"
[ -f "$SRC/plugin.json" ] || { echo "no $SRC/plugin.json" >&2; exit 1; }
python3 - "$SRC" <<'PY'
import json, sys, os
src = sys.argv[1]
p = json.load(open(os.path.join(src, "plugin.json")))
json.load(open(os.path.join(src, "mcp.json")))
o = p["extensions"]["com.openai"]; i = o["interface"]; r = o["review"]
errs = []
if len(i["displayName"]) > 30: errs.append("displayName > 30")
if len(i["shortDescription"]) > 30: errs.append("shortDescription > 30")
if len(i["longDescription"]) > 1024: errs.append("longDescription > 1024")
if len(i.get("defaultPrompt", [])) > 3 or any(len(x) > 128 for x in i.get("defaultPrompt", [])): errs.append("defaultPrompt")
tc = r["test_cases"]
if len(tc["positive"]) != 5 or len(tc["negative"]) != 3: errs.append("need 5 positive + 3 negative test cases")
if any(not c.get("tools_triggered") or not c.get("expected_behavior") for c in tc["positive"]): errs.append("positive case without tools_triggered/expected_behavior")
if not r.get("demo_recording_url", "").startswith("https://"): errs.append("demo_recording_url is not set")
for k in ("logo", "composerIcon"):
    if not os.path.isfile(os.path.join(src, i[k])): errs.append(f"{k} file missing")
if errs:
    sys.exit("plugin.json: " + "; ".join(errs))
print(p["version"])
PY
VERSION="$(python3 -c "import json;print(json.load(open('$SRC/plugin.json'))['version'])")"
mkdir -p "$ROOT/dist"
OUT="$ROOT/dist/$NAME-chatgpt-$VERSION.zip"
rm -f "$OUT"
(cd "$SRC" && zip -qrX "$OUT" plugin.json mcp.json assets)
unzip -l "$OUT"
echo "Built $OUT"
