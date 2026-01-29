# Learn Quest - Project Guidelines

## Release Checklist

릴리즈 시 다음 파일의 버전을 모두 업데이트:

| 파일 | 위치 |
|------|------|
| `.claude-plugin/plugin.json` | `"version": "X.Y.Z"` |
| `.claude-plugin/marketplace.json` | `"version": "X.Y.Z"` (root) |
| `.claude-plugin/marketplace.json` | `plugins[0].version` |
| `CHANGELOG.md` | `## [X.Y.Z] - YYYY-MM-DD` 섹션 추가 |

### Release Steps

1. 버전 파일 모두 업데이트
2. CHANGELOG.md에 릴리즈 노트 작성
3. `git add -A && git commit -m "chore: bump version to X.Y.Z"`
4. `git tag vX.Y.Z`
5. `git push origin main && git push origin vX.Y.Z`
6. `gh release create vX.Y.Z --title "vX.Y.Z - <title>" --notes "<notes>"`
7. PROGRESS.md 업데이트 (완료 내용 기록)

---

## Work Log Routine

작업 완료 후 PROGRESS.md 업데이트:
- 완료된 작업 기록
- 다음 세션 작업 목록 갱신

---

## Development Guidelines

- **Language**: 한국어 문서, 영어 코드 코멘트
- **Versioning**: Semantic Versioning (major.minor.patch)
- **Storage**: `~/.learn-quest/` for user data
