#!/usr/bin/env bash
# Generate a commit message from staged changes using opencode
# and copy it to the clipboard.
set -euo pipefail

diff=$(git diff --cached)
if [ -z "$diff" ]; then
  echo "No staged changes." >&2
  exit 1
fi

msg=$(printf '%s' "$diff" \
  | opencode run --agent commit-msg 'Write a git commit message for these staged changes. Output ONLY the message.' 2>/dev/null \
  | sed 's/\x1b\[[0-9;]*m//g' \
  | sed '/^> .* · /d' \
  | sed '/^[[:space:]]*$/{/./!d}')

printf '%s' "$msg" | setsid -f xclip -selection clipboard >/dev/null 2>&1

printf '%s\n' "$msg"
echo "--- copied to clipboard ---"
