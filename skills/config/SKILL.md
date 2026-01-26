---
name: config
description: Manage Learn Quest settings. Configure learning level, auto-explanation triggers, feature toggles, and language preferences.
argument-hint: "[show|reset|<key> <value>]"
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
  "storage": "local"
}
```

## Command Handling

### No arguments (`/learn-quest:config`)

Display an interactive settings menu:

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

### `show` argument (`/learn-quest:config show`)

Display current settings in JSON format.

### `reset` argument (`/learn-quest:config reset`)

Reset all settings to default values.

### `<key> <value>` arguments (`/learn-quest:config level gold`)

Directly change a specific setting.

**Supported keys and values:**

| Key | Valid Values |
|-----|--------------|
| `level` | bronze, silver, gold, platinum, diamond |
| `trigger` | on, off |
| `info` | on, off |
| `direction` | on, off |
| `cs_knowledge` | on, off |
| `quiz` | on, off |
| `language` | en, ko |
| `storage` | local, project |

## Error Handling

### Invalid Key

If user provides an unknown key:

```
❌ Unknown setting: "[key]"

Available settings:
• level (bronze/silver/gold/platinum/diamond)
• trigger (on/off)
• info (on/off)
• direction (on/off)
• cs_knowledge (on/off)
• quiz (on/off)
• language (en/ko)
• storage (local/project)

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
