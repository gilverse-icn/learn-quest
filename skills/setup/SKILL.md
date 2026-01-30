---
name: setup
description: Interactive initial setup for Learn Quest. Configure your learning level, language, and feature preferences.
argument-hint: ""
---

# Learn Quest Setup

The user wants to set up Learn Quest for the first time.

## Setup Flow

Guide the user through initial configuration with a friendly, interactive conversation.

### Step 1: Language Selection (FIRST)

```
🎮 LEARN QUEST - Setup
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🌐 Select your language / 언어를 선택하세요

1) English
2) 한국어

> Enter 1 or 2
```

**IMPORTANT:** All subsequent steps must be in the selected language.

---

## English Flow (if user selected English)

### Step 2: Welcome
```
Welcome! Let's configure your learning experience.
This will only take a moment.
```

### Step 3: Scenario Question (Open-ended)

```
📊 Quick question to understand your perspective:

"You've been assigned a new feature to implement.
What do you do first, before writing any code?"

> Please share your approach freely
```

**CRITICAL IMPLEMENTATION NOTE:**
- Do NOT use AskUserQuestion for this step (it forces multiple choice)
- Simply output the question text above and STOP
- Wait for the user to type their free-form answer naturally
- The user's next message will contain their answer
- Then proceed to Step 4 to analyze their response

### Step 4: Level Suggestion

Analyze the user's answer and suggest a level based on their perspective:

| Answer Pattern | Suggested Level |
|----------------|-----------------|
| "Just start coding" / "Figure it out as I go" | Bronze |
| "Understand requirements" / "Look at examples" | Silver |
| "Check existing patterns" / "Consider edge cases, testing" | Gold |
| "Analyze dependencies, impact scope, architecture" | Platinum |
| "Align with stakeholders, consider maintenance, team onboarding" | Diamond |

```
📊 Based on your answer, I'd suggest [Level] level.

[Level] level means:
• [perspective description]
• [what explanations will focus on]
• [example of explanation style]

Does this feel right?
1) Yes, that's right
2) I'd prefer more basics ([lower level])
3) I'd prefer more advanced ([higher level])

> Enter a number
```

### Step 5: Feature - Info

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ Feature Setup (1/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 Info (What & Why)

After Claude writes code, you'll see:
┌─────────────────────────────
│ 📚 What was done:
│ "Used useEffect here because we need to
│  fetch data when the component mounts."
└─────────────────────────────

Enable this feature?
1) Yes (Recommended)
2) No

> Enter 1 or 2
```

### Step 6: Feature - Direction

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ Feature Setup (2/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 Direction (Improvements & Alternatives)

After Claude completes a task, you'll see:
┌─────────────────────────────
│ 🔄 Consider for the future:
│ "This works well, but if you later need
│  caching, consider useSWR or React Query."
└─────────────────────────────

Enable this feature?
1) Yes (Recommended)
2) No

> Enter 1 or 2
```

### Step 7: Feature - CS Knowledge

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ Feature Setup (3/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 CS Knowledge (Related Concepts)

After explanations, you'll see:
┌─────────────────────────────
│ 💡 Related concept:
│ "This is the 'declarative programming' pattern.
│  Unlike imperative, you describe 'what' you want,
│  not 'how' to do it step by step."
└─────────────────────────────

Enable this feature?
1) Yes (Recommended)
2) No

> Enter 1 or 2
```

### Step 8: Feature - Quiz

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ Feature Setup (4/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📝 Quiz (Test Understanding)

After learning something, you can test yourself:
┌─────────────────────────────
│ 📝 Quick Check:
│ "Q: What does an empty dependency array []
│     in useEffect mean?"
│ A) Runs every render
│ B) Runs once on mount ✓
│ C) Runs on state change
└─────────────────────────────

Enable this feature?
1) Yes
2) No

> Enter 1 or 2
```

### Step 9: Learning Timing (Trigger Conditions)

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 Learning Timing
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

When should Learn Quest provide learning points?
(You can select multiple options)

1) When writing code (Recommended)
   → Get learning points when Claude writes/modifies code

2) When completing tasks
   → Get learning points when a feature/task is done

3) When answering questions
   → Get learning points when Claude answers your questions

4) All responses
   → Always provide learning points

5) Only when I ask
   → Only with /learn-quest:explain command

> Enter numbers separated by commas (e.g., 1,2)
```

**Mapping to config:**
- Option 1: `trigger.on_code_write: true`
- Option 2: `trigger.on_task_complete: true`
- Option 3: `trigger.on_question: true`
- Option 4: `trigger.on_all: true` (overrides others)
- Option 5: All triggers set to `false`

### Step 9b: Stash Mode

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 Stash Mode
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Too busy to learn right now?
Save learning points and study later!

Enable Stash mode?
1) Yes (Recommended) - Save points for later study
2) No - I'll learn in real-time only

> Enter 1 or 2
```

If user selects 1, ask about auto-prompt:
```
📦 Prompt to save after completing tasks?

When you finish a task (e.g., "thanks", "done"),
Learn Quest can ask if you want to save learning points.

1) Yes (Recommended) - Remind me to save
2) No - I'll save manually with /learn-quest:stash

> Enter 1 or 2
```

**Mapping to config:**
- Stash Yes: `stash.enabled: true`
- Stash No: `stash.enabled: false`
- Prompt Yes: `stash.prompt_on_complete: true`
- Prompt No: `stash.prompt_on_complete: false`

### Step 10: Confirmation

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Setup Complete!

Your configuration:
• Level: [selected level]
• Language: English
• Learning triggers:
  - On code write: [ON/OFF]
  - On task complete: [ON/OFF]
  - On question: [ON/OFF]
  - On all responses: [ON/OFF]
• Stash mode: [ON/OFF] (prompt on complete: [ON/OFF])
• Features:
  - Info: [ON/OFF]
  - Direction: [ON/OFF]
  - CS Knowledge: [ON/OFF]
  - Quiz: [ON/OFF]

Config saved to: ~/.learn-quest/config.json

You're ready to go! Try:
• /learn-quest:explain <concept> - Learn about something
• /learn-quest:stash - Save learning points for later
• /learn-quest:config - Change settings anytime
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Korean Flow (if user selected 한국어)

### Step 2: Welcome
```
환영합니다! 학습 환경을 설정해볼게요.
금방 끝납니다.
```

### Step 3: Scenario Question (Open-ended)

```
📊 간단한 질문 하나 드릴게요.

"새로운 기능을 맡았어요.
코드 작성 전에 가장 먼저 무엇을 하시나요?"

> 자유롭게 답변해주세요
```

**CRITICAL IMPLEMENTATION NOTE:**
- Do NOT use AskUserQuestion for this step (it forces multiple choice)
- Simply output the question text above and STOP
- Wait for the user to type their free-form answer naturally
- The user's next message will contain their answer
- Then proceed to Step 4 to analyze their response

### Step 4: Level Suggestion

Analyze the user's answer and suggest a level based on their perspective:

| 답변 패턴 | 추천 레벨 |
|-----------|----------|
| "일단 코딩부터" / "하면서 파악" | Bronze |
| "요구사항 파악" / "예시 찾아봄" | Silver |
| "기존 패턴 확인" / "엣지케이스, 테스트 고려" | Gold |
| "의존성, 영향 범위, 아키텍처 분석" | Platinum |
| "이해관계자 정렬, 유지보수, 팀 온보딩 고려" | Diamond |

```
📊 답변을 보니 [레벨] 레벨이 적합해 보여요.

[레벨] 레벨은:
• [관점 설명]
• [어떤 설명을 받게 되는지]
• [설명 스타일 예시]

맞는 것 같나요?
1) 네, 적절해요
2) 좀 더 기초부터 ([낮은 레벨])
3) 좀 더 심화로 ([높은 레벨])

> 번호를 입력하세요
```

### Step 5: Feature - Info

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ 기능 설정 (1/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 Info (무엇을 왜)

Claude가 코드 작성 후 이런 설명을 보게 돼요:
┌─────────────────────────────
│ 📚 작업 내용:
│ "여기서 useEffect를 쓴 이유는 컴포넌트가
│  마운트될 때 데이터를 불러오기 위함이에요."
└─────────────────────────────

이 기능을 활성화할까요?
1) 예 (권장)
2) 아니오

> 1 또는 2를 입력하세요
```

### Step 6: Feature - Direction

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ 기능 설정 (2/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 Direction (개선 방향)

Claude가 작업 완료 후 이런 제안을 보게 돼요:
┌─────────────────────────────
│ 🔄 나중에 고려해볼 점:
│ "지금은 잘 동작하지만, 캐싱이 필요하면
│  useSWR이나 React Query를 고려해보세요."
└─────────────────────────────

이 기능을 활성화할까요?
1) 예 (권장)
2) 아니오

> 1 또는 2를 입력하세요
```

### Step 7: Feature - CS Knowledge

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ 기능 설정 (3/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 CS Knowledge (관련 개념)

설명 후 이런 CS 개념 연결을 보게 돼요:
┌─────────────────────────────
│ 💡 관련 개념:
│ "이건 '선언적 프로그래밍' 패턴이에요.
│  명령형과 달리 '어떻게'가 아닌 '무엇을'
│  원하는지만 기술하죠."
└─────────────────────────────

이 기능을 활성화할까요?
1) 예 (권장)
2) 아니오

> 1 또는 2를 입력하세요
```

### Step 8: Feature - Quiz

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚙️ 기능 설정 (4/4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📝 Quiz (이해도 테스트)

학습 후 이렇게 테스트할 수 있어요:
┌─────────────────────────────
│ 📝 퀵 체크:
│ "Q: useEffect의 빈 의존성 배열 []은
│     언제 실행될까요?"
│ A) 매 렌더링마다
│ B) 마운트 시 한 번만 ✓
│ C) 상태 변경 시
└─────────────────────────────

이 기능을 활성화할까요?
1) 예
2) 아니오

> 1 또는 2를 입력하세요
```

### Step 9: Learning Timing (Trigger Conditions)

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 학습 타이밍 설정
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Learn Quest가 언제 학습 포인트를 제공할까요?
(복수 선택 가능)

1) 코드 작성 시 (권장)
   → Claude가 코드를 작성/수정할 때

2) 작업/기능 완성 시
   → 기능이나 작업이 완료될 때

3) 질문에 답변할 때
   → Claude가 질문에 답변할 때

4) 모든 응답에서
   → 항상 학습 포인트 제공

5) 직접 요청할 때만
   → /learn-quest:explain 명령어로만

> 쉼표로 구분해서 입력하세요 (예: 1,2)
```

**설정값 매핑:**
- 1번: `trigger.on_code_write: true`
- 2번: `trigger.on_task_complete: true`
- 3번: `trigger.on_question: true`
- 4번: `trigger.on_all: true` (다른 옵션 무시)
- 5번: 모든 trigger를 `false`로

### Step 9b: Stash Mode

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 Stash 모드
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

지금은 바빠서 학습할 시간이 없나요?
학습 포인트를 저장해두고 나중에 공부할 수 있어요!

Stash 모드를 활성화할까요?
1) 예 (권장) - 나중에 공부할 수 있게 저장
2) 아니오 - 실시간 학습만 할게요

> 1 또는 2를 입력하세요
```

사용자가 1을 선택하면 자동 제안 여부를 물어봅니다:
```
📦 작업 완료 시 저장을 제안할까요?

작업이 끝나면 (예: "고마워", "됐어")
학습 포인트를 저장할지 물어볼 수 있어요.

1) 예 (권장) - 저장할지 물어보기
2) 아니오 - /learn-quest:stash로 직접 저장

> 1 또는 2를 입력하세요
```

**설정값 매핑:**
- Stash 예: `stash.enabled: true`
- Stash 아니오: `stash.enabled: false`
- 제안 예: `stash.prompt_on_complete: true`
- 제안 아니오: `stash.prompt_on_complete: false`

### Step 10: Confirmation

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 설정 완료!

설정 내용:
• 레벨: [선택한 레벨]
• 언어: 한국어
• 학습 트리거:
  - 코드 작성 시: [ON/OFF]
  - 작업 완성 시: [ON/OFF]
  - 질문 답변 시: [ON/OFF]
  - 모든 응답: [ON/OFF]
• Stash 모드: [ON/OFF] (완료 시 제안: [ON/OFF])
• 기능:
  - Info: [ON/OFF]
  - Direction: [ON/OFF]
  - CS Knowledge: [ON/OFF]
  - Quiz: [ON/OFF]

설정 저장 위치: ~/.learn-quest/config.json

이제 시작하세요!
• /learn-quest:explain <개념> - 개념 설명 받기
• /learn-quest:stash - 학습 포인트 저장
• /learn-quest:config - 설정 변경
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Level Description Templates

Use these when suggesting a level to the user:

### Bronze
- EN: "Focuses on 'what is this?' with simple analogies and basic examples"
- KO: "'이게 뭐지?' 관점으로 쉬운 비유와 기본 예시 중심"

### Silver
- EN: "Focuses on 'how do I use this?' with implementation patterns and best practices"
- KO: "'어떻게 쓰지?' 관점으로 구현 패턴과 베스트 프랙티스 중심"

### Gold
- EN: "Focuses on 'why this approach?' with trade-offs, alternatives, and internals"
- KO: "'왜 이 방식이지?' 관점으로 트레이드오프, 대안, 내부 동작 중심"

### Platinum
- EN: "Focuses on 'what's the big picture?' with architecture, scalability, and team impact"
- KO: "'전체 그림은?' 관점으로 아키텍처, 확장성, 팀 영향 중심"

### Diamond
- EN: "Focuses on 'what's the strategic view?' with business impact, org considerations, long-term"
- KO: "'전략적 관점은?' 으로 비즈니스 영향, 조직 고려, 장기적 관점 중심"

---

## Implementation Notes

1. **Use AskUserQuestion tool** for most steps to get user input
2. **EXCEPTION - Step 3 (scenario question)**:
   - Do NOT use AskUserQuestion (it requires multiple choice options)
   - Instead, output the question as plain text and wait for user's next message
   - Analyze the user's free-form response to determine their level
3. **Save config** to `~/.learn-quest/config.json`
4. **Create directory** if `~/.learn-quest/` doesn't exist
5. **Config format:**

```json
{
  "level": "silver",
  "language": "en",
  "trigger": {
    "on_code_write": true,
    "on_task_complete": true,
    "on_question": false,
    "on_all": false
  },
  "features": {
    "info": true,
    "direction": true,
    "cs_knowledge": true,
    "quiz": false
  },
  "stash": {
    "enabled": true,
    "prompt_on_complete": true
  },
  "storage": "local"
}
```

6. **Level mapping:**
   - "bronze", "silver", "gold", "platinum", "diamond"

7. **Language mapping:**
   - 1 → "en"
   - 2 → "ko"

8. **Trigger mapping (Step 9):**
   - 1 → `trigger.on_code_write: true`
   - 2 → `trigger.on_task_complete: true`
   - 3 → `trigger.on_question: true`
   - 4 → `trigger.on_all: true`
   - 5 → All triggers `false`
   - Multiple selections: Set each selected trigger to `true`

9. **Stash mapping (Step 9b):**
   - 1 → `stash.enabled: true`
   - 2 → `stash.enabled: false`
   - Prompt 1 → `stash.prompt_on_complete: true`
   - Prompt 2 → `stash.prompt_on_complete: false`
