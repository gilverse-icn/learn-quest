# Changelog

All notable changes to Learn Quest will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.1] - 2026-01-28

### Changed
- **Learning Timing UX Overhaul** - Setup/Config에서 용어 및 플로우 개선
  - "패시브 모드", "Stash 모드" → "학습 타이밍" 개념으로 통합
  - Setup Step 9를 4가지 선택지로 재설계:
    1. 작업 중 바로 (실시간 학습)
    2. 나중에 따로 (저장 후 학습)
    3. 둘 다
    4. 직접 요청할 때만
  - 선택에 따라 조건부 후속 질문 (빈도, 저장 제안)
  - Setup Confirmation에 학습 타이밍 정보 반영 (영문/한글)
  - Config 메뉴에서 패시브/스태시를 "Learning timing" 하위로 그룹화
  - Config key/value 테이블에 Description 컬럼 추가
  - Config 에러 메시지에 각 설정별 설명 추가
  - Setup에 누락됐던 Stash 설정 단계 추가

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
