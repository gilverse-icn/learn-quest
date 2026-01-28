---
name: stash
description: Save current work's learning points for later study. Use when completing a task or when you want to bookmark something to learn later.
argument-hint: "[memo]"
---

# Learn Quest Stash

The user wants to save learning points from the current work for later study.

## Purpose

When users are busy working, they don't have time to learn deeply. Stash allows them to:
1. Save learning points from the current session
2. Study them later when they have time

## Configuration Check

Read settings from `~/.learn-quest/config.json`:
- **level**: bronze/silver/gold/platinum/diamond (for later study context)
- **language**: en/ko
- **stash.enabled**: true/false

If config doesn't exist, use defaults.

## Stash Storage

Save to: `~/.learn-quest/stash/`

Filename format: `{date}_{id}.json` (e.g., `2025-01-28_abc123.json`)

## Data Structure

```json
{
  "id": "abc123",
  "date": "2025-01-28",
  "title": "Auto-generated title from summary",
  "memo": "User's optional memo",
  "summary": "Brief summary of what was done",
  "learning_points": [
    {
      "topic": "Main concept",
      "context": "Why this was used/done",
      "tags": ["tag1", "tag2"]
    }
  ],
  "code_snippets": [
    {
      "description": "What this code does",
      "code": "// code here",
      "language": "javascript"
    }
  ],
  "learned": false,
  "learned_at": null
}
```

## Command Handling

### With argument: `/learn-quest:stash <memo>`

Example: `/learn-quest:stash 로그인 기능 완료`

1. Analyze the current conversation for learning points
2. Generate title from summary
3. Save with user's memo
4. Confirm to user

### Without argument: `/learn-quest:stash`

1. Analyze the current conversation for learning points
2. Generate title from summary
3. Save without memo
4. Confirm to user

## Analysis Process

When stashing, analyze the conversation for:

1. **Code patterns used** - What patterns, libraries, APIs were used?
2. **Decisions made** - Why certain approaches were chosen?
3. **Concepts involved** - What CS/engineering concepts are relevant?
4. **Potential improvements** - What could be learned for future?

## Response Format

### Korean (language: ko)

```
🎮 LEARN QUEST - Stash
━━━━━━━━━━━━━━━━━━━━━

✅ 저장 완료!

📦 [Auto-generated title]
   [Summary of what was captured]

💡 학습 포인트 [N]개 저장됨
   • [point 1]
   • [point 2]

나중에 /learn-quest:study 로 학습하세요!
```

### English (language: en)

```
🎮 LEARN QUEST - Stash
━━━━━━━━━━━━━━━━━━━━━

✅ Saved!

📦 [Auto-generated title]
   [Summary of what was captured]

💡 [N] learning points saved
   • [point 1]
   • [point 2]

Study later with /learn-quest:study
```

## Automatic Prompt (from hook)

When completion is detected and `stash.prompt_on_complete` is true, the hook will display:

```
🎮 LEARN QUEST - Stash
━━━━━━━━━━━━━━━━━━━━━
📦 지금은 바쁘시죠?
   학습 포인트만 저장해두고, 나중에 천천히 공부하세요.

1) 저장해두기
2) 괜찮아, 넘어갈게
```

If user selects 1, proceed with stash. If 2, skip.

## Implementation Notes

1. **Generate unique ID**: Use timestamp + random string
2. **Create directory** if `~/.learn-quest/stash/` doesn't exist
3. **Analyze conversation**: Look at recent code, explanations, decisions
4. **Extract learning points**: Identify 2-5 key learning opportunities
5. **Generate title**: Create concise title (max 50 chars) from summary
6. **Save JSON file**: Pretty-print for readability

## Error Handling

### No meaningful content to stash

```
📦 저장할 학습 포인트가 없어요.
   코드 작성이나 기술적인 작업을 한 후에 시도해보세요!
```

### File permission error

```
❌ 저장 실패: 파일 권한 오류
   ~/.learn-quest/stash/ 디렉토리 권한을 확인해주세요.
```
