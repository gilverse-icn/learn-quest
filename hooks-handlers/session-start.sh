#!/bin/bash

# Learn Quest - Session Start Hook
# Reads config and injects learning rules into Claude's context

CONFIG_FILE="$HOME/.learn-quest/config.json"

# Default values
LEVEL="silver"
LANGUAGE="en"
PASSIVE_ENABLED="true"
PASSIVE_FREQUENCY="auto"

# Trigger defaults (new expanded structure)
TRIGGER_CODE_WRITE="true"
TRIGGER_TASK_COMPLETE="true"
TRIGGER_QUESTION="false"
TRIGGER_ALL="false"

# Feature defaults
FEATURE_INFO="true"
FEATURE_DIRECTION="true"
FEATURE_CS_KNOWLEDGE="true"
FEATURE_QUIZ="false"

# Stash defaults
STASH_ENABLED="true"
STASH_PROMPT="true"

# Read config if exists
if [ -f "$CONFIG_FILE" ]; then
  CONFIG_CONTENT=$(cat "$CONFIG_FILE")

  # Basic settings
  LEVEL=$(echo "$CONFIG_CONTENT" | grep -o '"level"[[:space:]]*:[[:space:]]*"[^"]*"' | cut -d'"' -f4)
  LANGUAGE=$(echo "$CONFIG_CONTENT" | grep -o '"language"[[:space:]]*:[[:space:]]*"[^"]*"' | cut -d'"' -f4)

  # Passive settings
  PASSIVE_ENABLED=$(echo "$CONFIG_CONTENT" | grep -A5 '"passive"' | grep -o '"enabled"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  PASSIVE_FREQUENCY=$(echo "$CONFIG_CONTENT" | grep -A5 '"passive"' | grep -o '"frequency"[[:space:]]*:[[:space:]]*"[^"]*"' | cut -d'"' -f4)

  # Trigger settings (support both old and new format)
  # New format: trigger.on_code_write, trigger.on_task_complete, etc.
  TRIGGER_CODE_WRITE=$(echo "$CONFIG_CONTENT" | grep -A10 '"trigger"' | grep -o '"on_code_write"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  TRIGGER_TASK_COMPLETE=$(echo "$CONFIG_CONTENT" | grep -A10 '"trigger"' | grep -o '"on_task_complete"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  TRIGGER_QUESTION=$(echo "$CONFIG_CONTENT" | grep -A10 '"trigger"' | grep -o '"on_question"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  TRIGGER_ALL=$(echo "$CONFIG_CONTENT" | grep -A10 '"trigger"' | grep -o '"on_all"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')

  # Feature settings
  FEATURE_INFO=$(echo "$CONFIG_CONTENT" | grep -A10 '"features"' | grep -o '"info"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  FEATURE_DIRECTION=$(echo "$CONFIG_CONTENT" | grep -A10 '"features"' | grep -o '"direction"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  FEATURE_CS_KNOWLEDGE=$(echo "$CONFIG_CONTENT" | grep -A10 '"features"' | grep -o '"cs_knowledge"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  FEATURE_QUIZ=$(echo "$CONFIG_CONTENT" | grep -A10 '"features"' | grep -o '"quiz"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')

  # Stash settings
  STASH_ENABLED=$(echo "$CONFIG_CONTENT" | grep -A5 '"stash"' | grep -o '"enabled"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')
  STASH_PROMPT=$(echo "$CONFIG_CONTENT" | grep -A5 '"stash"' | grep -o '"prompt_on_complete"[[:space:]]*:[[:space:]]*[^,}]*' | grep -o 'true\|false')

  # Apply defaults for empty values
  [ -z "$LEVEL" ] && LEVEL="silver"
  [ -z "$LANGUAGE" ] && LANGUAGE="en"
  [ -z "$PASSIVE_ENABLED" ] && PASSIVE_ENABLED="true"
  [ -z "$PASSIVE_FREQUENCY" ] && PASSIVE_FREQUENCY="auto"
  [ -z "$TRIGGER_CODE_WRITE" ] && TRIGGER_CODE_WRITE="true"
  [ -z "$TRIGGER_TASK_COMPLETE" ] && TRIGGER_TASK_COMPLETE="true"
  [ -z "$TRIGGER_QUESTION" ] && TRIGGER_QUESTION="false"
  [ -z "$TRIGGER_ALL" ] && TRIGGER_ALL="false"
  [ -z "$FEATURE_INFO" ] && FEATURE_INFO="true"
  [ -z "$FEATURE_DIRECTION" ] && FEATURE_DIRECTION="true"
  [ -z "$FEATURE_CS_KNOWLEDGE" ] && FEATURE_CS_KNOWLEDGE="true"
  [ -z "$FEATURE_QUIZ" ] && FEATURE_QUIZ="false"
  [ -z "$STASH_ENABLED" ] && STASH_ENABLED="true"
  [ -z "$STASH_PROMPT" ] && STASH_PROMPT="true"
fi

# Build trigger conditions list
TRIGGER_CONDITIONS=""
if [ "$TRIGGER_ALL" = "true" ]; then
  TRIGGER_CONDITIONS="- ALL responses (on_all is enabled)"
else
  [ "$TRIGGER_CODE_WRITE" = "true" ] && TRIGGER_CONDITIONS="${TRIGGER_CONDITIONS}- When writing/modifying code\\n"
  [ "$TRIGGER_TASK_COMPLETE" = "true" ] && TRIGGER_CONDITIONS="${TRIGGER_CONDITIONS}- When completing a task/feature\\n"
  [ "$TRIGGER_QUESTION" = "true" ] && TRIGGER_CONDITIONS="${TRIGGER_CONDITIONS}- When answering questions\\n"
fi

# Build features list
FEATURES_LIST=""
[ "$FEATURE_INFO" = "true" ] && FEATURES_LIST="${FEATURES_LIST}- 📚 Info (what was done and why)\\n"
[ "$FEATURE_DIRECTION" = "true" ] && FEATURES_LIST="${FEATURES_LIST}- 🔄 Direction (improvements, alternatives)\\n"
[ "$FEATURE_CS_KNOWLEDGE" = "true" ] && FEATURES_LIST="${FEATURES_LIST}- 💡 CS Knowledge (related concepts)\\n"
[ "$FEATURE_QUIZ" = "true" ] && FEATURES_LIST="${FEATURES_LIST}- 📝 Quiz (level-appropriate questions)\\n"

# Build context based on language
if [ "$LANGUAGE" = "ko" ]; then
  MANDATORY_INSTRUCTION="## 🎮 Learn Quest - 학습 포인트 제공 규칙 (필수)\\n\\n**중요: 아래 조건에서 반드시 학습 포인트를 제공해야 합니다. 선택사항이 아닙니다.**\\n\\n### 학습 포인트 제공 조건\\n${TRIGGER_CONDITIONS}\\n### 포함할 내용\\n${FEATURES_LIST}\\n### 출력 형식 (반드시 이 형식 사용)\\n\\n\`\`\`\\n🎮 LEARN QUEST - 학습 포인트\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\n\\n[활성화된 기능에 따라 아래 섹션 포함]\\n\\n📚 작업 내용\\n- [무엇을 했고 왜 했는지]\\n\\n🔄 더 생각해볼 점\\n- [개선점, 대안]\\n\\n💡 관련 CS 지식\\n- [관련 개념 설명]\\n\\n📝 퀵 체크: [레벨에 맞는 질문]\\n\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\n\`\`\`\\n\\n### 사용자 레벨: ${LEVEL}\\n레벨에 맞는 깊이로 설명하세요:\\n- Bronze: 기초 개념, 쉬운 비유\\n- Silver: 구현 패턴, 베스트 프랙티스\\n- Gold: 트레이드오프, 내부 동작\\n- Platinum: 아키텍처, 시스템 설계\\n- Diamond: 전략적 관점, 비즈니스 영향"
else
  MANDATORY_INSTRUCTION="## 🎮 Learn Quest - Learning Point Rules (MANDATORY)\\n\\n**IMPORTANT: You MUST provide learning points under the conditions below. This is NOT optional.**\\n\\n### When to Provide Learning Points\\n${TRIGGER_CONDITIONS}\\n### Content to Include\\n${FEATURES_LIST}\\n### Output Format (MUST use this format)\\n\\n\`\`\`\\n🎮 LEARN QUEST - Learning Points\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\n\\n[Include sections based on enabled features]\\n\\n📚 What was done\\n- [What and why]\\n\\n🔄 Points to consider\\n- [Improvements, alternatives]\\n\\n💡 Related CS Knowledge\\n- [Related concepts]\\n\\n📝 Quick Check: [Level-appropriate question]\\n\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\n\`\`\`\\n\\n### User Level: ${LEVEL}\\nExplain at appropriate depth:\\n- Bronze: Basic concepts, simple analogies\\n- Silver: Implementation patterns, best practices\\n- Gold: Trade-offs, internals\\n- Platinum: Architecture, system design\\n- Diamond: Strategic view, business impact"
fi

# Build commands section
COMMANDS_SECTION="### Available Commands\\n- /learn-quest:explain <concept> - Explain a concept\\n- /learn-quest:config - Manage settings\\n- /learn-quest:setup - Initial setup wizard\\n- /learn-quest:stash [memo] - Save learning points\\n- /learn-quest:study [filter] - Study saved points"

# Output JSON for Claude context
cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "${MANDATORY_INSTRUCTION}\\n\\n${COMMANDS_SECTION}"
  }
}
EOF

exit 0
