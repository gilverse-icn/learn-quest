#!/bin/bash

# Learn Quest - Session Start Hook
# Reads config and injects learning rules into Claude's context

CONFIG_FILE="$HOME/.learn-quest/config.json"

# Default values
LEVEL="silver"
LANGUAGE="en"
PASSIVE_ENABLED="true"

# Read config if exists
if [ -f "$CONFIG_FILE" ]; then
  LEVEL=$(cat "$CONFIG_FILE" | grep -o '"level"[[:space:]]*:[[:space:]]*"[^"]*"' | cut -d'"' -f4)
  LANGUAGE=$(cat "$CONFIG_FILE" | grep -o '"language"[[:space:]]*:[[:space:]]*"[^"]*"' | cut -d'"' -f4)
  PASSIVE_ENABLED=$(cat "$CONFIG_FILE" | grep -o '"enabled"[[:space:]]*:[[:space:]]*[^,}]*' | head -1 | grep -o 'true\|false')

  # Use defaults if not found
  [ -z "$LEVEL" ] && LEVEL="silver"
  [ -z "$LANGUAGE" ] && LANGUAGE="en"
  [ -z "$PASSIVE_ENABLED" ] && PASSIVE_ENABLED="true"
fi

# Read stash settings
STASH_ENABLED="true"
STASH_PROMPT="true"
if [ -f "$CONFIG_FILE" ]; then
  STASH_ENABLED=$(cat "$CONFIG_FILE" | grep -A2 '"stash"' | grep -o '"enabled"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  STASH_PROMPT=$(cat "$CONFIG_FILE" | grep -A2 '"stash"' | grep -o '"prompt_on_complete"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  [ -z "$STASH_ENABLED" ] && STASH_ENABLED="true"
  [ -z "$STASH_PROMPT" ] && STASH_PROMPT="true"
fi

# Output JSON for Claude context
cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "## Learn Quest Active\\n\\nLearn Quest plugin is enabled for this session.\\n\\n### User Settings\\n- Level: ${LEVEL}\\n- Language: ${LANGUAGE}\\n- Passive Mode: ${PASSIVE_ENABLED}\\n- Stash Mode: ${STASH_ENABLED} (prompt: ${STASH_PROMPT})\\n\\n### Passive Learning Mode\\nWhen passive mode is enabled, naturally include brief learning insights when answering questions. Keep them concise and relevant.\\n\\n### Available Commands\\n- /learn-quest:explain <concept> - Explain a concept at user's level\\n- /learn-quest:config - Manage settings\\n- /learn-quest:setup - Initial setup wizard\\n- /learn-quest:stash [memo] - Save learning points for later\\n- /learn-quest:study [filter] - Study saved learning points"
  }
}
EOF

exit 0
