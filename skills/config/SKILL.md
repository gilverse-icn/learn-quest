---
name: config
description: This skill should be used when the user asks to "configure learn quest", "change learn quest settings", "show learn quest config", "reset learn quest settings", or wants to modify learning level, language, or feature preferences.
---

# Learn Quest Configuration Management

The user wants to view or modify Learn Quest settings.

## Configuration File Handling

### File Locations
- **Local storage**: `~/.learn-quest/config.json`
- **Project storage**: `./.learn-quest/config.json`

### If Config File Doesn't Exist

1. **Create the directory** if `~/.learn-quest/` doesn't exist
2. **Create config file** with default values
3. **Notify user**:

```
📝 No configuration found. Created default config at ~/.learn-quest/config.json

Tip: Run /learn-quest:setup for interactive configuration!
```

4. **Continue** with the requested operation using defaults

## Default Values

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
  "passive": {
    "enabled": true,
    "frequency": "auto"
  },
  "stash": {
    "enabled": true,
    "prompt_on_complete": true
  },
  "storage": "local"
}
```

### Learning Timing: While Working (passive)

Real-time learning during coding sessions. Claude automatically adds learning points while working.

- **enabled**: When true, Claude detects learning opportunities and adds Learn Quest sections
- **frequency**: Controls how often learning elements appear
  - `auto`: Adjusts based on user level and learning history (recommended)
  - `high`: Almost every learning opportunity
  - `medium`: Moderate frequency
  - `low`: Rarely, only for important concepts

### Learning Timing: Save for Later (stash)

Save learning points when busy, study them later with `/learn-quest:study`.

- **enabled**: When true, stash features are available
- **prompt_on_complete**: When true, suggests saving after task completion
  - Detects completion signals: "고마워", "됐어", "done", "thanks", etc.
  - Shows: "지금은 바쁘시죠? 학습 포인트만 저장해두고, 나중에 천천히 공부하세요."

## Command Handling

### No arguments (`/learn-quest:config`)

Display an interactive settings menu:

```
🎮 LEARN QUEST Settings

Current configuration:
• Level: [current level]
• Auto-explanation: [ON/OFF]
• Learning timing:
  - While working (real-time): [ON/OFF] (frequency: [auto/high/medium/low])
  - Save for later: [ON/OFF] (prompt on complete: [ON/OFF])
• Info: [ON/OFF]
• Direction: [ON/OFF]
• CS Knowledge: [ON/OFF]
• Quiz: [ON/OFF]
• Language: [en/ko]
• Storage: [local/project]

What would you like to change?
1) Change level (Bronze/Silver/Gold/Platinum/Diamond)
2) Toggle auto-explanation ON/OFF
3) Configure learning timing (real-time / save for later)
4) Configure individual features
5) Change language
6) Change storage location
7) Reset to defaults

> Enter a number
```

### `show` argument (`/learn-quest:config show`)

Display current settings in JSON format.

### `reset` argument (`/learn-quest:config reset`)

Reset all settings to default values.

### `<key> <value>` arguments (`/learn-quest:config level gold`)

Directly change a specific setting.

**Supported keys and values:**

| Key | Description | Valid Values |
|-----|-------------|--------------|
| `level` | Learning level | bronze, silver, gold, platinum, diamond |
| `trigger` | Auto-explanation on task complete | on, off |
| `passive` | While working (real-time learning) | on, off |
| `passive_frequency` | Real-time learning frequency | auto, high, medium, low |
| `stash` | Save for later (stash learning) | on, off |
| `stash_prompt` | Suggest saving on task complete | on, off |
| `info` | What & why explanations | on, off |
| `direction` | Improvement suggestions | on, off |
| `cs_knowledge` | Related CS concepts | on, off |
| `quiz` | Understanding quizzes | on, off |
| `language` | Display language | en, ko |
| `storage` | Config file location | local, project |

## Error Handling

### Invalid Key

If user provides an unknown key:

```
❌ Unknown setting: "[key]"

Available settings:
• level (bronze/silver/gold/platinum/diamond) - Learning level
• trigger (on/off) - Auto-explanation on task complete
• passive (on/off) - While working (real-time learning)
• passive_frequency (auto/high/medium/low) - Real-time learning frequency
• stash (on/off) - Save for later (stash learning)
• stash_prompt (on/off) - Suggest saving on task complete
• info (on/off) - What & why explanations
• direction (on/off) - Improvement suggestions
• cs_knowledge (on/off) - Related CS concepts
• quiz (on/off) - Understanding quizzes
• language (en/ko) - Display language
• storage (local/project) - Config file location

Example: /learn-quest:config level gold
```

### Invalid Value

If user provides an invalid value:

```
❌ Invalid value for [key]: "[value]"

Valid values: [list of valid values]

Example: /learn-quest:config [key] [valid_example]
```

### File Permission Error

If cannot write to config file:

```
❌ Cannot write to config file: [path]

Please check file permissions or try:
/learn-quest:config storage project
```

## Level Descriptions

When the user changes their level, explain what each level means:

| Level | Experience | Learning Focus |
|-------|------------|----------------|
| **Bronze** | 0-2 years | Basic syntax, fundamental concepts |
| **Silver** | 2-4 years | Implementation patterns, best practices |
| **Gold** | 4-7 years | Optimization, trade-offs |
| **Platinum** | 7-10 years | Architecture, system design |
| **Diamond** | 10+ years | Technical strategy, organizational impact |

## Language Support

Output in the language specified by current `config.language`:
- `en`: English (default)
- `ko`: Korean (한국어)

## Response Format

### Success
```
✅ Settings updated successfully.

Changed:
• [key]: [old value] → [new value]
```

### Multiple Changes
```
✅ Settings updated successfully.

Changed:
• [key1]: [old] → [new]
• [key2]: [old] → [new]
```
