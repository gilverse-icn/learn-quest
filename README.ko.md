# 🎮 Learn Quest

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> AI 코딩 어시스턴트를 위한 RPG 스타일 학습 동반자

[English Documentation](./README.md)

---

AI 코딩 어시스턴트는 편리하지만, **무엇을 왜 그렇게 했는지** 모르고 넘어가는 경우가 많습니다.

Learn Quest는 AI 어시스턴트와 함께 코드를 작성하면서 **동시에 학습**할 수 있게 해주는 플러그인입니다. 레벨에 맞는 설명과 퀴즈를 제공합니다.

## 📑 목차

- [빠른 시작](#-빠른-시작)
- [기능](#-기능)
- [레벨 시스템](#-레벨-시스템)
- [언어 지원](#-언어-지원)
- [설치](#-설치)
- [설정 옵션](#-설정-옵션)
- [사용 예시](#-사용-예시)
- [프로젝트 구조](#-프로젝트-구조)
- [개발](#-개발)
- [로드맵](#️-로드맵)
- [기여](#-기여)
- [라이선스](#-라이선스)

## 🚀 빠른 시작

```bash
# 1. 마켓플레이스 추가
/plugin marketplace add https://github.com/gilverse-icn/learn-quest

# 2. 플러그인 설치
/plugin install learn-quest@learn-quest

# 3. 셋업 실행
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
- **📝 퀴즈**: 레벨별 맞춤 퀴즈 (Bronze는 T/F, Silver는 코드 빈칸, Gold는 트레이드오프 비교 등)

### 🎮 패시브 학습 모드
질문할 때 자동으로 학습 요소를 추가합니다 - 별도 명령어 없이!

"이거 뭐야?", "이건 어떻게 동작해?" 같이 질문하면, Learn Quest가:
- 학습 기회를 감지
- 관련 인사이트와 고려사항 추가
- 관련 개념 제안
- 간헐적으로 퀴즈 출제 (활성화된 경우)

**빈도는 자동 조절** - 레벨과 학습 기록에 따라 조절됩니다.

### 📦 Stash 모드 (`/learn-quest:stash`, `/learn-quest:study`)
지금 당장 공부할 시간이 없나요? 학습 포인트만 저장해두고 나중에 공부하세요!

**워크플로우:**
1. 평소처럼 작업하기
2. 완료되면 Learn Quest가 물어봄: "저장해둘까요?"
3. "저장"을 선택하면 학습 포인트 저장
4. 나중에 여유있을 때 `/learn-quest:study`로 학습

```bash
# 메모와 함께 수동 저장
/learn-quest:stash "로그인 기능 완료"

# 저장된 내용 학습
/learn-quest:study              # 목록 보기
/learn-quest:study today        # 오늘 저장한 것만
/learn-quest:study jwt          # 키워드 검색
```

**자동 감지:** Learn Quest가 완료 신호("고마워", "됐어", "done")를 감지하면 저장할지 물어봐요.

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

| 랭크 | 관점 | 학습 방향 |
|------|------|----------|
| **Bronze** | "이게 뭐지?" | 기초 문법, 기본 개념 |
| **Silver** | "어떻게 쓰지?" | 구현 패턴, 베스트 프랙티스 |
| **Gold** | "왜 이 방식이지?" | 최적화, 트레이드오프 |
| **Platinum** | "전체 그림은?" | 아키텍처, 시스템 설계 |
| **Diamond** | "전략적 관점은?" | 기술 전략, 조직 영향 |

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
# 마켓플레이스 추가 및 설치
/plugin marketplace add https://github.com/gilverse-icn/learn-quest
/plugin install learn-quest@learn-quest
```

### 첫 설정

설치 후 셋업 마법사를 실행하세요:

```bash
/learn-quest:setup
```

다음 항목을 설정합니다:
1. 언어 선택 (English / 한국어)
2. 시나리오 질문 - AI가 답변을 분석해서 레벨 추천
3. 레벨 확인 또는 조정
4. 개별 기능 설정 (시각적 예시 포함)

**또는 셋업 건너뛰기** - 바로 사용 시작하면 Learn Quest가 기본 설정을 자동 생성합니다.

## 📋 설정 옵션

| 설정 | 옵션 | 기본값 | 설명 |
|------|------|--------|------|
| `level` | bronze/silver/gold/platinum/diamond | silver | 학습 레벨 |
| `language` | en/ko | en | 출력 언어 |
| `trigger.on_task_complete` | true/false | true | 자동 설명 활성화 |
| `passive.enabled` | true/false | true | 패시브 학습 모드 |
| `passive.frequency` | auto/high/medium/low | auto | 학습 요소 빈도 |
| `stash.enabled` | true/false | true | Stash 모드 활성화 |
| `stash.prompt_on_complete` | true/false | true | 완료 시 저장 여부 질문 |
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

### Stash 모드

```
You: "API에 에러 핸들링 추가해줘"

Claude: [코드 작성] 완료했어요!

🎮 LEARN QUEST - Stash
━━━━━━━━━━━━━━━━━━━━━
📦 지금은 바쁘시죠?
   학습 포인트만 저장해두고, 나중에 천천히 공부하세요.

1) 저장해두기
2) 괜찮아, 넘어갈게

You: 1

✅ 저장 완료!

📦 API 에러 핸들링 및 재시도 로직
   에러 바운더리, 지수 백오프, 서킷 브레이커 패턴

💡 학습 포인트 3개 저장됨

나중에 /learn-quest:study 로 학습하세요!
```

### Study 모드

```
You: /learn-quest:study

🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 저장된 학습 포인트

1) [01/28] API 에러 핸들링 및 재시도 로직
2) [01/27] JWT 인증 구현
3) [01/25] React Query 캐싱 전략

> 번호를 선택하세요

You: 1

🎮 LEARN QUEST - Study
━━━━━━━━━━━━━━━━━━━━━

📚 API 에러 핸들링 및 재시도 로직
   저장일: 2025-01-28

[레벨에 맞는 상세 설명...]

━━━━━━━━━━━━━━━━━━━━━
🎯 다음은?

1) 더 깊이
2) 학습 완료 표시
3) 목록으로
```

## 📁 프로젝트 구조

```
learn-quest/
├── .claude-plugin/
│   ├── plugin.json          # 플러그인 매니페스트
│   └── marketplace.json     # 마켓플레이스 카탈로그
├── skills/
│   ├── setup/
│   │   └── SKILL.md         # 셋업 마법사 스킬
│   ├── config/
│   │   └── SKILL.md         # 설정 스킬
│   ├── explain/
│   │   └── SKILL.md         # 설명 스킬
│   ├── stash/
│   │   └── SKILL.md         # Stash 스킬 (나중에 학습용)
│   └── study/
│       └── SKILL.md         # Study 스킬 (저장된 내용 학습)
├── hooks/
│   └── hooks.json           # Hook 설정
├── hooks-handlers/
│   ├── session-start.sh     # 세션 시작 핸들러
│   └── completion-detect.sh # 완료 감지 핸들러
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
