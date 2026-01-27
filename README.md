# 🎮 Learn Quest

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> RPG-style learning companion for AI coding assistants

[한국어 문서 (Korean)](./README.ko.md)

---

AI coding assistants are convenient, but we often move on without understanding **what was done and why**.

Learn Quest is a plugin that helps you **learn while coding** with AI assistants, providing level-appropriate explanations and quizzes.

## 🚀 Quick Start

```bash
# 1. Add the marketplace
/plugin marketplace add github:gilverse-icn/learn-quest

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
- **📝 Quiz**: Test your understanding

### 🎮 Passive Learning Mode
Automatically adds learning elements when you ask questions - no special commands needed!

When you ask "What is this?" or "How does this work?", Learn Quest:
- Detects learning opportunities
- Adds relevant insights and considerations
- Suggests related concepts
- Occasionally quizzes you (if enabled)

**Frequency adjusts automatically** based on your level and learning history.

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

| Rank | Experience | Learning Focus |
|------|------------|----------------|
| **Bronze** | 0-2 years | Basic syntax, fundamental concepts |
| **Silver** | 2-4 years | Implementation patterns, best practices |
| **Gold** | 4-7 years | Optimization, trade-offs |
| **Platinum** | 7-10 years | Architecture, system design |
| **Diamond** | 10+ years | Technical strategy, organizational impact |

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
/plugin marketplace add github:gilverse-icn/learn-quest
/plugin install learn-quest@learn-quest
```

### First-Time Setup

After installation, run the setup wizard:

```bash
/learn-quest:setup
```

This will guide you through:
1. Language selection (English / 한국어)
2. Experience level (Bronze → Diamond)
3. Feature preferences (Info, Direction, CS Knowledge, Quiz)

**Or skip setup** and start using directly - Learn Quest will create default settings automatically.

## 📋 Configuration Options

| Setting | Options | Default | Description |
|---------|---------|---------|-------------|
| `level` | bronze/silver/gold/platinum/diamond | silver | Learning level |
| `language` | en/ko | en | Output language |
| `trigger.on_task_complete` | true/false | true | Auto-explanation enabled |
| `passive.enabled` | true/false | true | Passive learning mode |
| `passive.frequency` | auto/high/medium/low | auto | How often to show learning elements |
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
│   └── explain/
│       └── SKILL.md         # Explain skill
├── hooks/
│   └── hooks.json           # Auto-explanation hook
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
