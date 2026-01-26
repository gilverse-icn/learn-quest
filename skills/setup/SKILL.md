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

### Step 3: Level Selection
```
📊 What's your experience level?

1) Bronze   - New to programming (0-2 years)
2) Silver   - Familiar with basics (2-4 years)
3) Gold     - Experienced developer (4-7 years)
4) Platinum - Senior developer (7-10 years)
5) Diamond  - Tech lead / Architect (10+ years)

> Enter a number (1-5)
```

### Step 4: Feature Selection
```
⚙️ Which features do you want enabled?

1) Info        - Explain what was done and why
2) Direction   - Suggest improvements and alternatives
3) CS Knowledge - Related computer science concepts
4) Quiz        - Test your understanding

Default: 1, 2, 3 enabled / 4 disabled

> Enter numbers to toggle (e.g., "4" to also enable Quiz)
> Or type "all" for all features, "default" for recommended
```

### Step 5: Confirmation
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Setup Complete!

Your configuration:
• Level: [selected level]
• Language: English
• Features: [enabled features list]

Config saved to: ~/.learn-quest/config.json

You're ready to go! Try:
• /learn-quest:explain <concept> - Learn about something
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

### Step 3: Level Selection
```
📊 개발 경력이 어느 정도인가요?

1) Bronze   - 프로그래밍 입문 (0-2년)
2) Silver   - 기본기 습득 (2-4년)
3) Gold     - 숙련 개발자 (4-7년)
4) Platinum - 시니어 개발자 (7-10년)
5) Diamond  - 테크 리드 / 아키텍트 (10년+)

> 번호를 입력하세요 (1-5)
```

### Step 4: Feature Selection
```
⚙️ 어떤 기능을 활성화할까요?

1) Info        - 무엇을 왜 했는지 설명
2) Direction   - 개선 방향 및 대안 제시
3) CS Knowledge - 관련 컴퓨터 과학 개념
4) Quiz        - 이해도 테스트

기본값: 1, 2, 3 활성화 / 4 비활성화

> 토글할 번호 입력 (예: "4" 입력 시 퀴즈도 활성화)
> 또는 "all" (전체) / "default" (기본값)
```

### Step 5: Confirmation
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 설정 완료!

설정 내용:
• 레벨: [선택한 레벨]
• 언어: 한국어
• 기능: [활성화된 기능 목록]

설정 저장 위치: ~/.learn-quest/config.json

이제 시작하세요!
• /learn-quest:explain <개념> - 개념 설명 받기
• /learn-quest:config - 설정 변경
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Implementation Notes

1. **Use AskUserQuestion tool** for each step to get user input
2. **Save config** to `~/.learn-quest/config.json`
3. **Create directory** if `~/.learn-quest/` doesn't exist
4. **Config format:**

```json
{
  "level": "silver",
  "language": "en",
  "trigger": {
    "on_task_complete": true
  },
  "features": {
    "info": true,
    "direction": true,
    "cs_knowledge": true,
    "quiz": false
  },
  "storage": "local"
}
```

5. **Level mapping:**
   - 1 → "bronze"
   - 2 → "silver"
   - 3 → "gold"
   - 4 → "platinum"
   - 5 → "diamond"

6. **Language mapping:**
   - 1 → "en"
   - 2 → "ko"
