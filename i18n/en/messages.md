# Learn Quest English Message Templates

This file contains English message templates used when `language: "en"` is set.

## Config Menu

```
🎮 LEARN QUEST Settings

Current configuration:
• Level: [current level]
• Auto-explanation: [ON/OFF]
• Passive mode: [ON/OFF] (frequency: [auto/high/medium/low])
• Info: [ON/OFF]
• Direction: [ON/OFF]
• CS Knowledge: [ON/OFF]
• Quiz: [ON/OFF]
• Language: [en/ko]
• Storage: [local/project]

What would you like to change?
1) Change level (Bronze/Silver/Gold/Platinum/Diamond)
2) Toggle auto-explanation ON/OFF
3) Configure passive mode
4) Configure individual features
5) Change language
6) Change storage location
7) Reset to defaults

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

## Passive Mode Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎮 LEARN QUEST (Passive)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 Points to consider
- [key insight]

💡 Related Concept
- [CS concept briefly explained]

📝 Quick Check: [simple question]
```

## Passive Mode Setup

```
🎯 Enable Passive Learning Mode?

Passive mode automatically adds learning elements when you ask questions.
Instead of just getting answers, you'll also get:
- Key insights and considerations
- Related CS concepts
- Occasional quick quizzes (if enabled)

This helps you learn while coding, without extra effort.

1) Yes, enable passive mode (Recommended)
2) No, I'll use /learn-quest:explain when I want to learn
```

## Frequency Selection

```
📊 How often should learning elements appear?

1) Auto   - Adjusts based on your level and experience (Recommended)
2) High   - Almost every opportunity
3) Medium - Moderate frequency
4) Low    - Rarely, only important concepts
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

Why this is correct:
[detailed explanation of the concept]

Why your answer was off:
[specific feedback on misconception]

💡 Key takeaway: [one-sentence summary]
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

## Level-Based Quiz Templates

### Bronze Quiz
```
📝 Quick Check

Q: True or False?
"[statement about concept]"

[ True ] [ False ]
```

### Silver Quiz
```
📝 Code Challenge

Q: Fill in the blank:
```javascript
[code with ???]
```

Options:
A) [option]
B) [option]
C) [option]
```

### Gold Quiz
```
📝 Decision Time

Q: Given this scenario:
[scenario description]

Which approach would you choose and why?
A) [approach A]
B) [approach B]

> Type your answer with reasoning
```

### Platinum Quiz
```
📝 Architecture Check

Q: Consider this system design:
[design description]

[architecture question]

> Share your analysis
```

### Diamond Quiz
```
📝 Strategic Thinking

Q: Your team is considering:
[strategic scenario]

What factors would you weigh in this decision?

> Share your perspective
```

## Dynamic Difficulty Messages

### Level Up Suggestion
```
🎯 Great job! You got [X]/[Y] correct recently.

You seem ready for a bigger challenge!
Would you like to try [next level] level questions?

[ Yes, level up! ] [ No, stay at current level ]
```

### Level Changed
```
🎮 Level updated!

Previous: [old level]
New: [new level]

Your next quiz will reflect the new difficulty.
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
