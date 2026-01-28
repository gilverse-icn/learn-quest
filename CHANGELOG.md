# Changelog

All notable changes to Learn Quest will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2025-01-28

### Added
- **Stash Mode** - "Capture now, learn later" workflow
  - `/learn-quest:stash [memo]` - Save learning points for later study
  - `/learn-quest:study [filter]` - Review and learn from stashed items
  - Auto-detection of task completion signals ("고마워", "done", "완료", etc.)
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
  - Level-based question perspective (나무→숲): Bronze focuses on "what", Diamond on strategic impact
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
