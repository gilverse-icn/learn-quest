# Learn Quest English Message Templates

This file contains English message templates used when `language: "en"` is set.

## Config Menu

```
🎮 LEARN QUEST Settings

Current configuration:
• Level: [current level]
• Auto-explanation: [ON/OFF]
• Info: [ON/OFF]
• Direction: [ON/OFF]
• CS Knowledge: [ON/OFF]
• Quiz: [ON/OFF]
• Language: [en/ko]
• Storage: [local/project]

What would you like to change?
1) Change level (Bronze/Silver/Gold/Platinum/Diamond)
2) Toggle auto-explanation ON/OFF
3) Configure individual features
4) Change language
5) Change storage location
6) Reset to defaults

> Enter a number
```

## Explain Mode Selection

```
🎮 LEARN QUEST

What would you like to learn about?

1) Explain the code I just worked on
2) I'll type what I want to learn

> Select a number
```

## Auto-explanation Output (Hook)

```
🎮 LEARN QUEST - Learning Points
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 What was done (Info)
- [explanation]

🔄 Points to consider (Direction)
- [direction]

💡 Related CS Knowledge
- [CS concept]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 Would you like to take a quiz? [Yes/No]
```

## Quiz Messages

### Quiz Start
```
📝 Would you like to take a quiz on this topic?

[Yes] [No]
```

### Correct Answer
```
✅ Correct!

[explanation]
```

### Wrong Answer
```
❌ Not quite!

Correct answer: [answer]
Explanation: [explanation]
```

### Quiz Results
```
🎯 Quiz Results

Score: [correct]/[total]

Strengths:
• [what you did well]

Areas to improve:
• [topics related to missed questions]
```

## Level-Based Explanation Frames

### Bronze (0-2 years)
```
📚 What is [concept]?

Simply put... [everyday analogy]

In code:
[simple example]

Key points:
• [point 1]
• [point 2]
```

### Silver (2-4 years)
```
📚 [Concept] Explained

Concept:
[core explanation]

Implementation pattern:
[code example]

Best practices:
• [practice 1]
• [practice 2]

Watch out for:
• [common mistake]
```

### Gold (4-7 years)
```
📚 [Concept] Deep Dive

How it works:
[internal mechanics explanation]

Comparison:
| Approach | Pros | Cons |
|----------|------|------|
| A | ... | ... |
| B | ... | ... |

Optimization opportunities:
• [optimization 1]
• [optimization 2]

When to choose what:
[situational guidance]
```

### Platinum (7-10 years)
```
📚 [Concept] - Architectural View

Role in the system:
[position in overall architecture]

Design considerations:
• [scalability]
• [maintainability]
• [failure handling]

Team perspective:
• [collaboration considerations]
• [documentation needs]
```

### Diamond (10+ years)
```
📚 [Concept] - Strategic View

Business impact:
[how technical choices affect business]

Organizational perspective:
• [team structure implications]
• [onboarding considerations]
• [technical debt management]

Long-term considerations:
• [6-month outlook]
• [technology trends]
• [migration costs]
```

## Common Messages

### Settings Changed
```
✅ Settings updated successfully.

Changed:
• [key]: [old value] → [new value]
```

### Settings Reset
```
✅ Settings have been reset to defaults.
```

### Error Message
```
❌ Invalid input.

Valid options: [option list]
```

### Learn More
```
💡 Want to learn more? [related keywords]
```
