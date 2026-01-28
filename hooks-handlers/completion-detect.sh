#!/bin/bash

# Learn Quest - Completion Detection Hook
# Detects task completion signals and prompts for stash

CONFIG_FILE="$HOME/.learn-quest/config.json"

# Default values
STASH_ENABLED="true"
STASH_PROMPT="true"
LANGUAGE="ko"

# Read config if exists
if [ -f "$CONFIG_FILE" ]; then
  # Read stash settings
  STASH_ENABLED=$(cat "$CONFIG_FILE" | grep -A2 '"stash"' | grep -o '"enabled"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  STASH_PROMPT=$(cat "$CONFIG_FILE" | grep -A2 '"stash"' | grep -o '"prompt_on_complete"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  LANGUAGE=$(cat "$CONFIG_FILE" | grep -o '"language"[[:space:]]*:[[:space:]]*"[^"]*"' | cut -d'"' -f4)

  # Use defaults if not found
  [ -z "$STASH_ENABLED" ] && STASH_ENABLED="true"
  [ -z "$STASH_PROMPT" ] && STASH_PROMPT="true"
  [ -z "$LANGUAGE" ] && LANGUAGE="ko"
fi

# If stash is disabled or prompt is disabled, exit silently
if [ "$STASH_ENABLED" != "true" ] || [ "$STASH_PROMPT" != "true" ]; then
  echo '{"hookSpecificOutput": {}}'
  exit 0
fi

# Get user prompt from stdin (Claude Code passes it)
USER_PROMPT=$(cat)

# Completion signal patterns (Korean and English)
# Korean: 고마워, 됐어, 완료, 끝, 잘됐다, 오 된다, 감사, 수고
# English: thanks, done, complete, finished, perfect, great, awesome
COMPLETION_PATTERNS="고마워|됐어|완료|끝났|잘됐|잘 됐|오 된다|감사|수고|thanks|thank you|done|complete|finished|perfect|great work|awesome|looks good|lgtm"

# Check if user prompt contains completion signal
if echo "$USER_PROMPT" | grep -qiE "$COMPLETION_PATTERNS"; then
  # Detected completion signal - add context for AI to prompt stash
  if [ "$LANGUAGE" = "ko" ]; then
    CONTEXT="## Learn Quest - Stash 알림\\n\\n작업 완료 신호가 감지되었습니다. 응답 마지막에 다음 stash 프롬프트를 표시해주세요:\\n\\n\`\`\`\\n🎮 LEARN QUEST - Stash\\n━━━━━━━━━━━━━━━━━━━━━\\n📦 지금은 바쁘시죠?\\n   학습 포인트만 저장해두고, 나중에 천천히 공부하세요.\\n\\n1) 저장해두기\\n2) 괜찮아, 넘어갈게\\n\`\`\`\\n\\n사용자가 1을 선택하면 /learn-quest:stash 기능을 실행하세요."
  else
    CONTEXT="## Learn Quest - Stash Reminder\\n\\nTask completion signal detected. At the end of your response, display this stash prompt:\\n\\n\`\`\`\\n🎮 LEARN QUEST - Stash\\n━━━━━━━━━━━━━━━━━━━━━\\n📦 Busy right now?\\n   Save the learning points and study later at your own pace.\\n\\n1) Save for later\\n2) Skip\\n\`\`\`\\n\\nIf user selects 1, execute /learn-quest:stash functionality."
  fi

  cat << EOF
{
  "hookSpecificOutput": {
    "additionalContext": "${CONTEXT}"
  }
}
EOF
else
  # No completion signal detected
  echo '{"hookSpecificOutput": {}}'
fi

exit 0
