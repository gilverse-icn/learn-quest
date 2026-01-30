# Changelog

All notable changes to Learn Quest will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.2] - 2026-01-30

### Added
- **Learning Trigger System** - Fine-grained control over when learning points appear
  - `trigger.on_code_write` - When Claude writes/modifies code
  - `trigger.on_task_complete` - When completing tasks/features
  - `trigger.on_question` - When answering questions
  - `trigger.on_all` - Always provide learning points
  - Multiple triggers can be enabled simultaneously

### Changed
- **Mandatory Learning Points** - Learning points are now REQUIRED (not optional) when trigger conditions are met
- **session-start.sh** - Complete rewrite to read all settings and generate strong instructions
- **Setup Step 9** - Now supports multiple trigger selection with comma-separated input
- **Setup Step 9b** - Stash mode configuration separated into its own step
- **Config menu** - Updated to reflect new trigger options

### Removed
- `passive.enabled` and `passive.frequency` settings (replaced by trigger system)

### Migration
- Existing configs with `passive.enabled: true` should set `trigger.on_code_write: true` and `trigger.on_task_complete: true`

## [0.2.1] - 2026-01-28

### Changed
- **Learning Timing UX Overhaul** - Improved terminology and flow in Setup/Config
  - Unified "Passive Mode" and "Stash Mode" into a single "Learning Timing" concept
  - Redesigned Setup Step 9 with 4 clear options:
    1. While working (real-time learning)
    2. Save for later (stash and study)
    3. Both
    4. Only when I ask
  - Added conditional follow-up questions based on selection (frequency, save prompt)
  - Reflected learning timing info in Setup Confirmation (English/Korean)
  - Grouped passive/stash under "Learning timing" in Config menu
  - Added Description column to Config key/value table
  - Added per-setting descriptions to Config error messages
  - Added missing Stash configuration step to Setup flow

## [0.2.0] - 2025-01-28

### Added
- **Stash Mode** - "Capture now, learn later" workflow
  - `/learn-quest:stash [memo]` - Save learning points for later study
  - `/learn-quest:study [filter]` - Review and learn from stashed items
  - Auto-detection of task completion signals ("thanks", "done", etc.)
  - Prompts user to stash when task is completed
  - Learning points stored in `~/.learn-quest/stash/`
  - Mark items as "learned" after studying

- **New Configuration Options**
  - `stash.enabled` - Enable/disable stash mode
  - `stash.prompt_on_complete` - Auto-prompt on task completion

- **New Hooks**
  - `UserPromptSubmit` hook for completion detection
  - `completion-detect.sh` handler script

### Changed
- Updated README with stash feature documentation and usage examples
- Updated config skill to include stash settings
- Session start now shows stash/study commands in available commands

## [0.1.1] - 2025-01-27

### Added
- **Quiz System Enhancement**
  - Level-based question perspective (tree→forest): Bronze focuses on "what", Diamond on strategic impact
  - Quiz types by level: T/F for Bronze, code blanks for Silver, trade-off comparisons for Gold, etc.
  - Dynamic difficulty suggestion: prompts level-up when 80%+ correct on recent 5 questions
  - Enhanced wrong answer feedback with "why correct", "where you went wrong", and key takeaway

- **Setup Improvements**
  - Scenario-based level detection: asks "What do you do first when assigned a new feature?"
  - AI analyzes free-form answer to suggest appropriate level
  - User can confirm or adjust suggested level
  - Individual feature setup with visual examples (no more hidden defaults)
  - Enhanced passive mode explanation with concrete output example

### Changed
- Quiz me option now uses Level-Based Question Perspective guide
- Wrong answer feedback structure improved for better learning

## [0.1.0] - 2025-01-26

### Added
- Initial release
- `/learn-quest:setup` - Interactive configuration
- `/learn-quest:explain` - Concept explanation at user's level
- `/learn-quest:config` - Settings management
- Level-based explanations (Bronze to Diamond)
- i18n support (English, Korean)
- Passive learning mode
- Quiz feature (basic)
