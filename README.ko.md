# 🎮 Learn Quest

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> AI 코딩 어시스턴트를 위한 RPG 스타일 학습 동반자

[English Documentation](./README.md)

---

AI 코딩 어시스턴트는 편리하지만, **무엇을 왜 그렇게 했는지** 모르고 넘어가는 경우가 많습니다.

Learn Quest는 AI 어시스턴트와 함께 코드를 작성하면서 **동시에 학습**할 수 있게 해주는 플러그인입니다. 레벨에 맞는 설명과 퀴즈를 제공합니다.

## 🚀 빠른 시작

```bash
# 1. 플러그인 설치
/plugin install github:gilverse-icn/learn-quest

# 2. 셋업 실행
/learn-quest:setup
```

끝! 셋업 마법사가 학습 레벨과 선호 설정을 안내합니다.

> **참고:** 셋업을 건너뛰면 Learn Quest가 기본 설정으로 자동 시작하고, 첫 사용 시 설정 파일을 자동 생성합니다.

## ✨ 기능

### 🎯 자동 설명
코드 작성/수정 후 자동으로 학습 포인트를 제공합니다.

- **📚 정보 제공**: 무엇을 했는지, 왜 이렇게 했는지
- **🔄 방향성 제시**: 최적화 가능성, 대안적 접근
- **💡 CS 지식**: 관련 컴퓨터 과학 개념
- **📝 퀴즈**: 이해도 테스트

### 📖 개념 설명 (`/learn-quest:explain`)
특정 개념이나 최근 작업에 대해 상세 설명을 요청할 수 있습니다.

```bash
/learn-quest:explain React hooks
/learn-quest:explain Next.js 16    # 최신 정보 웹 검색
/learn-quest:explain               # 선택 메뉴 표시
```

**스마트 기능:**
- 🔍 **웹 검색**: 프레임워크 버전, 최신 업데이트, 트렌드를 자동 검색
- 📁 **코드베이스 참조**: 설명 시 프로젝트 코드 참조 가능
- 📎 **출처 표시**: 웹 검색 사용 시 항상 출처 포함

### 🛠️ 셋업 (`/learn-quest:setup`)
대화형 초기 설정 마법사입니다.

```bash
/learn-quest:setup   # 원하는 언어로 가이드 진행
```

### ⚙️ 설정 (`/learn-quest:config`)
학습 레벨, 기능 ON/OFF, 언어 등을 설정합니다.

```bash
/learn-quest:config              # 대화형 메뉴
/learn-quest:config show         # 현재 설정 보기
/learn-quest:config level gold   # 레벨 변경
/learn-quest:config language ko  # 한국어로 전환
```

## 🏆 레벨 시스템

경력에 따른 5단계 랭크 시스템으로, 각 레벨에 맞는 깊이의 설명을 제공합니다.

| 랭크 | 경력 | 학습 방향 |
|------|------|----------|
| **Bronze** | 0-2년 | 기초 문법, 기본 개념 |
| **Silver** | 2-4년 | 구현 패턴, 베스트 프랙티스 |
| **Gold** | 4-7년 | 최적화, 트레이드오프 |
| **Platinum** | 7-10년 | 아키텍처, 시스템 설계 |
| **Diamond** | 10년+ | 기술 전략, 조직 영향 |

## 🌍 언어 지원

Learn Quest는 다국어를 지원합니다:
- **English** (`en`) - 기본값
- **한국어** (`ko`)

언어 변경:
```bash
/learn-quest:config language ko
```

## 🚀 설치

### Claude Code

```bash
/plugin install github:gilverse-icn/learn-quest
```

### 첫 설정

설치 후 셋업 마법사를 실행하세요:

```bash
/learn-quest:setup
```

다음 항목을 설정합니다:
1. 언어 선택 (English / 한국어)
2. 경력 레벨 (Bronze → Diamond)
3. 기능 선호도 (Info, Direction, CS Knowledge, Quiz)

**또는 셋업 건너뛰기** - 바로 사용 시작하면 Learn Quest가 기본 설정을 자동 생성합니다.

## 📋 설정 옵션

| 설정 | 옵션 | 기본값 | 설명 |
|------|------|--------|------|
| `level` | bronze/silver/gold/platinum/diamond | silver | 학습 레벨 |
| `language` | en/ko | en | 출력 언어 |
| `trigger.on_task_complete` | true/false | true | 자동 설명 활성화 |
| `features.info` | true/false | true | 작업 내용 표시 |
| `features.direction` | true/false | true | 개선 제안 표시 |
| `features.cs_knowledge` | true/false | true | CS 개념 표시 |
| `features.quiz` | true/false | false | 퀴즈 활성화 |
| `storage` | local/project | local | 설정 저장 위치 |

설정 파일 위치: `~/.learn-quest/config.json`

## 🎯 사용 예시

### 자동 설명

```
You: "투두 리스트 API 연동해줘"

Claude: [코드 작성]

🎮 LEARN QUEST - 학습 포인트
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 작업 내용
- fetch API로 서버에서 데이터를 가져옴
- async/await 패턴으로 비동기 처리

🔄 더 생각해볼 점
- React Query나 SWR로 캐싱 추가 가능
- 에러 바운더리로 에러 처리 개선 가능

💡 관련 CS 지식
- HTTP 요청/응답 사이클
- Promise와 비동기 프로그래밍
```

### 개념 설명

```
You: /learn-quest:explain useEffect

🎮 LEARN QUEST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 useEffect 설명

[레벨에 맞는 상세 설명]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📎 출처:
- [React 공식 문서](https://react.dev)

💡 관련 주제: useCallback, useMemo, 의존성 배열

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 다음은?

1) 더 깊이 - 더 자세히 설명
2) 퀴즈 - 이해도 테스트
3) 완료 - 작업 계속
```

## 📁 프로젝트 구조

```
learn-quest/
├── .claude-plugin/
│   └── plugin.json          # 플러그인 매니페스트
├── skills/
│   ├── setup/
│   │   └── SKILL.md         # 셋업 마법사 스킬
│   ├── config/
│   │   └── SKILL.md         # 설정 스킬
│   └── explain/
│       └── SKILL.md         # 설명 스킬
├── hooks/
│   └── hooks.json           # 자동 설명 Hook
├── i18n/
│   ├── en/
│   │   └── messages.md      # 영어 템플릿
│   └── ko/
│       └── messages.md      # 한국어 템플릿
├── README.md                # 영어 문서
├── README.ko.md             # 한국어 문서
└── LICENSE
```

## 🔧 개발

```bash
# 클론
git clone https://github.com/gilverse-icn/learn-quest.git
cd learn-quest

# 로컬 테스트
claude --plugin-dir .

# 셋업 테스트
/learn-quest:setup
```

## 🗺️ 로드맵

### Phase 2 (예정)
- XP/레벨 진행 시스템
- 학습 기록 추적
- 상태 표시 (`/learn-quest:status`)
- 커밋 시 트리거
- 세션 요약
- 복습 제안

## 🤝 기여

이슈와 PR을 환영합니다!

## 📄 라이선스

MIT License - 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

---

코딩하면서 배우고 싶은 개발자를 위해 💜 로 만들었습니다.
