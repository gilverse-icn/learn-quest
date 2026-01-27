---
name: explain
description: This skill should be used when the user asks to "explain a concept", "teach me about", "what is", "how does X work", or wants to learn about programming concepts, code changes, or technical topics at their skill level.
---

# Learn Quest Concept Explanation

The user has requested a learning explanation.

## Available Tools

You can and SHOULD use these tools during explanation:

| Tool | When to Use |
|------|-------------|
| **WebSearch** | Frameworks, libraries, version-specific, best practices, trends |
| **Grep/Glob** | User asks about "my code", "this project", "our implementation" |
| **Read** | Need to show specific file content from user's codebase |

## Search Decision Rule

**"Would this be the same 10 years ago and 10 years from now?"**

**YES → Explain directly (no search):**
- Data structures (Array, Tree, Graph, Hash Table)
- Algorithms (Sorting, BFS/DFS, Binary Search, Recursion)
- CS fundamentals (Big O, Memory, Process vs Thread, TCP/IP)
- Language basics (Closure, Hoisting, Inheritance, Polymorphism)
- Design patterns (Singleton, Factory, Observer, MVC)

**NO → Search first:**
- Framework/library features (React, Next.js, Vue, etc.)
- Version-specific changes ("React 19", "TypeScript 5.x")
- Best practices, trends ("2025 recommended pattern")
- Tools (Vite, Turbopack, Bun)
- Anything with version numbers or years

## Configuration Check

Read settings from `~/.learn-quest/config.json` or `./.learn-quest/config.json`:
- **level**: bronze/silver/gold/platinum/diamond
- **language**: en/ko
- **features.quiz**: true/false

If config file doesn't exist, use defaults: level=silver, language=en, quiz=false

## Handling Ambiguous Requests

When the request is vague or could mean multiple things:

1. Make your best guess based on context
2. Provide the explanation
3. End with: "If you meant something else, let me know!" (or Korean equivalent based on language setting)

Example:
- User: "explain hooks"
- Ambiguous: React hooks? Git hooks? Lifecycle hooks?
- Action: Assume React hooks (most common), explain, then ask if they meant something else

## Mode Detection

### Mode A: With argument (`/learn-quest:explain <concept>`)

Examples:
- `/learn-quest:explain React hooks`
- `/learn-quest:explain caching strategies`

→ Directly explain the concept using the rules above

### Mode B: No argument (`/learn-quest:explain`)

Show selection menu:

```
🎮 LEARN QUEST

What would you like to learn about?

1) Explain the code I just worked on
2) I'll type what I want to learn

> Select a number
```

**Option 1:** Find recently written/modified code from conversation context, then explain it
**Option 2:** Ask for input, then explain that concept

## Level-Based Explanation Guide

### Bronze (0-2 years) - "What is this?"
- Use everyday analogies
- Define all technical terms
- Simplest possible code examples

**Template:**
```
📚 What is [concept]?

Simply put... [everyday analogy]

In code:
[simplest example]

Key points:
• [point 1]
• [point 2]
```

### Silver (2-4 years) - "How do I use this?"
- Implementation patterns
- Real-world use cases
- Common mistakes to avoid

**Template:**
```
📚 [Concept] Explained

Concept:
[core explanation]

Implementation:
[code example]

Best practices:
• [practice 1]
• [practice 2]

Watch out for:
• [common mistake]
```

### Gold (4-7 years) - "Why this approach?"
- Trade-offs and alternatives
- Performance considerations
- Internal mechanics

**Template:**
```
📚 [Concept] Deep Dive

How it works:
[internal mechanics]

Comparison:
| Approach | Pros | Cons |
|----------|------|------|
| A | ... | ... |
| B | ... | ... |

Optimization tips:
• [tip 1]
• [tip 2]

When to use what:
[situational guidance]
```

### Platinum (7-10 years) - "What's the big picture?"
- Architectural perspective
- System design implications
- Scalability, maintainability

**Template:**
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

### Diamond (10+ years) - "What's the strategic view?"
- Technical strategy
- Organizational impact
- Long-term considerations

**Template:**
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

## Language Support

Output in the language specified by `config.language`:
- `en`: English (default)
- `ko`: Korean - load templates from `i18n/ko/messages.md`

## Response Format

Always use this structure:

```
🎮 LEARN QUEST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 [Title]

[Level-appropriate explanation with code examples, tables, etc.]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📎 Sources: (if web search was used)
- [Source Title](URL)
- [Source Title](URL)

💡 Related topics: [topic1], [topic2], [topic3]
```

## Source Citation Rule

**ALWAYS include sources when WebSearch was used.**
- List all relevant URLs as markdown links
- Place at the end before "Related topics"

## Post-Explanation Interaction

After providing the explanation, offer follow-up options:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 What's next?

1) Go deeper - explain in more detail
2) Quiz me - test my understanding
3) Done - continue working

> Select a number or ask a follow-up question
```

### Option Handling

**1) Go deeper:**
- Ask: "Which part would you like me to explain further?"
- Provide more detailed explanation on that specific area

**2) Quiz me:** (only if `features.quiz` is enabled in config)
- Generate 2-3 questions at user's level
- Mix formats: multiple choice, true/false, code completion
- Show answer + explanation immediately after each response
- End with score summary

**3) Done:**
- End the explanation session
- Return to normal conversation

### If user asks follow-up question directly:
- Answer the question
- Show the interaction options again
