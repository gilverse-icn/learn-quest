---
name: study
description: Review and learn from previously stashed learning points. Use when you have time to study what you saved earlier.
argument-hint: "[filter]"
---

# Learn Quest Study

The user wants to study previously stashed learning points.

## Purpose

Users stash learning points when busy. Now they have time to:
1. Review what they saved
2. Get detailed explanations at their level
3. Mark items as learned

## Configuration Check

Read settings from `~/.learn-quest/config.json`:
- **level**: bronze/silver/gold/platinum/diamond
- **language**: en/ko
- **features.quiz**: true/false (offer quiz after explanation)

## Stash Storage Location

Read from: `~/.learn-quest/stash/*.json`

## Command Handling

### No argument: `/learn-quest:study`

Show list of all unlearned stashes.

### With filter: `/learn-quest:study <filter>`

| Filter | Description |
|--------|-------------|
| `today` | Today's stashes only |
| `week` | This week's stashes |
| `all` | Include learned items too |
| `<keyword>` | Search by title/tags |

Examples:
- `/learn-quest:study today`
- `/learn-quest:study jwt`
- `/learn-quest:study all`

## Study Flow

### Step 1: Show List

```
🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 저장된 학습 포인트

1) [01/28] JWT 기반 로그인 인증 구현
2) [01/27] API 에러 핸들링 패턴
3) [01/25] React Query 캐싱 전략

총 3개 | /learn-quest:study all 로 완료 항목도 보기

> 번호를 선택하세요
```

If no stashes:

```
📚 저장된 학습 포인트가 없어요.

작업 완료 후 /learn-quest:stash 로 저장해보세요!
```

### Step 2: Provide Explanation

After user selects an item, provide level-appropriate explanation.

Use the same Level-Based Explanation Guide from `/learn-quest:explain`:

- **Bronze**: "What is this?" - Simple analogies, basic examples
- **Silver**: "How do I use this?" - Implementation patterns, best practices
- **Gold**: "Why this approach?" - Trade-offs, alternatives, internals
- **Platinum**: "What's the big picture?" - Architecture, scalability
- **Diamond**: "What's the strategic view?" - Business impact, long-term

### Step 3: Post-Study Options

After explanation:

```
━━━━━━━━━━━━━━━━━━━━━
🎯 다음은?

1) 더 깊이 - 더 자세히 설명
2) 퀴즈 - 이해도 테스트 (if quiz enabled)
3) 학습 완료 - 이 항목 완료 표시
4) 목록으로 - 다른 항목 선택

> 번호를 선택하세요
```

### Step 4: Mark as Learned

When user selects "학습 완료":

1. Update the stash file:
```json
{
  "learned": true,
  "learned_at": "2025-01-30"
}
```

2. Confirm:
```
✅ 학습 완료로 표시했어요!

📊 학습 현황
   • 이번 주: 3개 완료
   • 전체: 12개 완료

다른 항목도 공부할까요?
1) 네, 목록 보기
2) 아니오, 종료
```

## Response Format

### List View (Korean)

```
🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 저장된 학습 포인트

1) [01/28] JWT 기반 로그인 인증 구현
2) [01/27] API 에러 핸들링 패턴
3) [01/25] React Query 캐싱 전략

총 3개

> 번호를 선택하세요
```

### List View (English)

```
🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 Saved Learning Points

1) [01/28] JWT-based Login Authentication
2) [01/27] API Error Handling Patterns
3) [01/25] React Query Caching Strategy

3 items total

> Select a number
```

### Explanation View

```
🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 JWT 기반 로그인 인증 구현
   저장일: 2025-01-28

[Level-appropriate detailed explanation based on stored context]

━━━━━━━━━━━━━━━━━━━━━

💡 관련 개념: [related topics]

━━━━━━━━━━━━━━━━━━━━━
🎯 다음은?

1) 더 깊이 - 더 자세히 설명
2) 학습 완료 - 이 항목 완료 표시
3) 목록으로 - 다른 항목 선택
```

## Implementation Notes

1. **Read all stash files**: Glob `~/.learn-quest/stash/*.json`
2. **Filter by learned status**: Default shows `learned: false` only
3. **Sort by date**: Most recent first
4. **Pagination**: If more than 10 items, paginate
5. **Update file on learned**: Modify the JSON file in place

## Quiz Integration

If `features.quiz` is true, offer quiz option after explanation.
Use the same quiz system from `/learn-quest:explain`:
- Level-based question types
- Track correct/incorrect
- Suggest level-up if 80%+ correct

## Natural Language Support

Users can also ask naturally:
- "저번에 저장해둔 거 설명해줘"
- "JWT 관련해서 stash한 거 있어?"
- "오늘 저장한 학습 포인트 보여줘"

Detect these patterns and invoke study functionality.

## Error Handling

### No stash directory

```
📚 아직 저장된 학습 포인트가 없어요.

작업 완료 후 /learn-quest:stash 로 저장해보세요!
```

### Invalid selection

```
❌ 잘못된 선택이에요. 1-3 사이의 번호를 입력해주세요.
```

### File read error

```
❌ 파일을 읽을 수 없어요: [filename]
   파일이 손상되었을 수 있습니다.
```
