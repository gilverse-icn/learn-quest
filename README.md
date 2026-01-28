# 🎮 Learn Quest

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> RPG-style learning companion for AI coding assistants

[한국어 문서 (Korean)](./README.ko.md)

---

AI coding assistants are convenient, but we often move on without understanding **what was done and why**.

Learn Quest is a plugin that helps you **learn while coding** with AI assistants, providing level-appropriate explanations and quizzes.

## 📑 Table of Contents

- [Quick Start](#-quick-start)
- [Features](#-features)
- [Level System](#-level-system)
- [Language Support](#-language-support)
- [Installation](#-installation)
- [Configuration Options](#-configuration-options)
- [Usage Examples](#-usage-examples)
- [Project Structure](#-project-structure)
- [Development](#-development)
- [Roadmap](#️-roadmap)
- [Contributing](#-contributing)
- [License](#-license)

## 🚀 Quick Start

```bash
# 1. Add the marketplace
/plugin marketplace add https://github.com/gilverse-icn/learn-quest

# 2. Install the plugin
/plugin install learn-quest@learn-quest

# 3. Run setup
/learn-quest:setup
```

That's it! The setup wizard will guide you through configuring your learning level and preferences.

> **Note:** If you skip setup, Learn Quest will use default settings and create a config file automatically on first use.

## ✨ Features

### 🎯 Auto-Explanation
Automatically provides learning points after code is written/modified.

- **📚 Info**: What was done and why
- **🔄 Direction**: Optimization opportunities, alternative approaches
- **💡 CS Knowledge**: Related computer science concepts
- **📝 Quiz**: Level-appropriate questions (T/F for Bronze, code blanks for Silver, trade-off comparisons for Gold, etc.)

### 🎮 Passive Learning Mode
Automatically adds learning elements when you ask questions - no special commands needed!

When you ask "What is this?" or "How does this work?", Learn Quest:
- Detects learning opportunities
- Adds relevant insights and considerations
- Suggests related concepts
- Occasionally quizzes you (if enabled)

**Frequency adjusts automatically** based on your level and learning history.

### 📦 Stash Mode (`/learn-quest:stash`, `/learn-quest:study`)
Too busy to learn right now? Save learning points for later!

**Workflow:**
1. Work on your task as usual
2. When you finish, Learn Quest asks: "Save for later study?"
3. Select "Save" to stash the learning points
4. Study later when you have time with `/learn-quest:study`

```bash
# Manual stash with memo
/learn-quest:stash "Login feature complete"

# Study saved points
/learn-quest:study              # Show list
/learn-quest:study today        # Today's only
/learn-quest:study jwt          # Search by keyword
```

**Auto-detection:** Learn Quest detects completion signals ("thanks", "done", "완료") and prompts you to stash.

### 📖 Concept Explanation (`/learn-quest:explain`)
Request detailed explanations of specific concepts or recent work.

```bash
/learn-quest:explain React hooks
/learn-quest:explain Next.js 16    # Uses web search for latest info
/learn-quest:explain               # Shows selection menu
```

**Smart Features:**
- 🔍 **Web Search**: Automatically searches for framework versions, latest updates, and trends
- 📁 **Codebase Reference**: Can reference your project code when explaining
- 📎 **Source Citations**: Always includes sources when web search is used

### 🛠️ Setup (`/learn-quest:setup`)
Interactive first-time configuration wizard.

```bash
/learn-quest:setup   # Guided setup in your preferred language
```

### ⚙️ Configuration (`/learn-quest:config`)
Configure your learning level, feature toggles, and language.

```bash
/learn-quest:config              # Interactive menu
/learn-quest:config show         # View current settings
/learn-quest:config level gold   # Change level
/learn-quest:config language ko  # Switch to Korean
```

## 🏆 Level System

A 5-tier rank system based on experience, providing depth-appropriate explanations.

| Rank | Perspective | Learning Focus |
|------|-------------|----------------|
| **Bronze** | "What is this?" | Basic syntax, fundamental concepts |
| **Silver** | "How do I use this?" | Implementation patterns, best practices |
| **Gold** | "Why this approach?" | Optimization, trade-offs |
| **Platinum** | "What's the big picture?" | Architecture, system design |
| **Diamond** | "What's the strategic view?" | Technical strategy, organizational impact |

## 🌍 Language Support

Learn Quest supports multiple languages:
- **English** (`en`) - Default
- **Korean** (`ko`) - 한국어

Change language with:
```bash
/learn-quest:config language ko
```

## 🚀 Installation

### Claude Code

```bash
# Add marketplace and install
/plugin marketplace add https://github.com/gilverse-icn/learn-quest
/plugin install learn-quest@learn-quest
```

### First-Time Setup

After installation, run the setup wizard:

```bash
/learn-quest:setup
```

This will guide you through:
1. Language selection (English / 한국어)
2. Scenario question - AI analyzes your approach to suggest a level
3. Level confirmation or adjustment
4. Individual feature setup with visual examples

**Or skip setup** and start using directly - Learn Quest will create default settings automatically.

## 📋 Configuration Options

| Setting | Options | Default | Description |
|---------|---------|---------|-------------|
| `level` | bronze/silver/gold/platinum/diamond | silver | Learning level |
| `language` | en/ko | en | Output language |
| `trigger.on_task_complete` | true/false | true | Auto-explanation enabled |
| `passive.enabled` | true/false | true | Passive learning mode |
| `passive.frequency` | auto/high/medium/low | auto | How often to show learning elements |
| `stash.enabled` | true/false | true | Stash mode enabled |
| `stash.prompt_on_complete` | true/false | true | Prompt to stash on task completion |
| `features.info` | true/false | true | Show what was done |
| `features.direction` | true/false | true | Show improvement suggestions |
| `features.cs_knowledge` | true/false | true | Show CS concepts |
| `features.quiz` | true/false | false | Enable quizzes |
| `storage` | local/project | local | Config storage location |

Config file location: `~/.learn-quest/config.json`

## 🎯 Usage Examples

### Auto-Explanation

```
You: "Connect the todo list API"

Claude: [writes code]

🎮 LEARN QUEST - Learning Points
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 What was done
- Used fetch API to retrieve data from server
- Implemented async/await pattern for asynchronous handling

🔄 Points to consider
- Could add caching with React Query or SWR
- Error boundary could improve error handling

💡 Related CS Knowledge
- HTTP request/response cycle
- Promises and asynchronous programming
```

### Concept Explanation

```
You: /learn-quest:explain useEffect

🎮 LEARN QUEST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 useEffect Explained

[Level-appropriate detailed explanation]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📎 Sources:
- [React Documentation](https://react.dev)

💡 Related topics: useCallback, useMemo, dependency arrays

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 What's next?

1) Go deeper - explain in more detail
2) Quiz me - test my understanding
3) Done - continue working
```

### Stash Mode

```
You: "Add error handling to the API"

Claude: [writes code] Done!

🎮 LEARN QUEST - Stash
━━━━━━━━━━━━━━━━━━━━━
📦 Busy right now?
   Save the learning points and study later at your own pace.

1) Save for later
2) Skip

You: 1

✅ Saved!

📦 API Error Handling with Retry Logic
   Error boundaries, exponential backoff, circuit breaker pattern

💡 3 learning points saved

Study later with /learn-quest:study
```

### Study Mode

```
You: /learn-quest:study

🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 Saved Learning Points

1) [01/28] API Error Handling with Retry Logic
2) [01/27] JWT Authentication Implementation
3) [01/25] React Query Caching Strategy

> Select a number

You: 1

🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 API Error Handling with Retry Logic
   Saved: 2025-01-28

[Level-appropriate detailed explanation...]

━━━━━━━━━━━━━━━━━━━━━
🎯 What's next?

1) Go deeper
2) Mark as learned
3) Back to list
```

## 📁 Project Structure

```
learn-quest/
├── .claude-plugin/
│   ├── plugin.json          # Plugin manifest
│   └── marketplace.json     # Marketplace catalog
├── skills/
│   ├── setup/
│   │   └── SKILL.md         # Setup wizard skill
│   ├── config/
│   │   └── SKILL.md         # Config skill
│   ├── explain/
│   │   └── SKILL.md         # Explain skill
│   ├── stash/
│   │   └── SKILL.md         # Stash skill (save for later)
│   └── study/
│       └── SKILL.md         # Study skill (learn stashed items)
├── hooks/
│   └── hooks.json           # Hooks configuration
├── hooks-handlers/
│   ├── session-start.sh     # Session start handler
│   └── completion-detect.sh # Completion detection handler
├── i18n/
│   ├── en/
│   │   └── messages.md      # English templates
│   └── ko/
│       └── messages.md      # Korean templates
├── README.md                # English documentation
├── README.ko.md             # Korean documentation
└── LICENSE
```

## 🔧 Development

```bash
# Clone
git clone https://github.com/gilverse-icn/learn-quest.git
cd learn-quest

# Test locally
claude --plugin-dir .

# Test setup
/learn-quest:setup
```

## 🗺️ Roadmap

### Phase 2 (Planned)
- XP/Level progression system
- Learning history tracking
- Status display (`/learn-quest:status`)
- Commit-time triggers
- Session summary
- Spaced repetition suggestions

## 🤝 Contributing

Issues and PRs are welcome!

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

---

Made with 💜 for developers who want to learn while coding.
