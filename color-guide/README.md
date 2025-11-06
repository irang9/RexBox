# Color Guide

이 디렉토리에는 shared-scss의 색상 팔레트를 브라우저에서 확인할 수 있는 샘플 파일들이 포함되어 있습니다.

## index.html

shared-scss의 theme과 variables 색상 팔레트를 브라우저에서 확인할 수 있는 HTML 파일입니다.

### GitHub에서 보기

**Private 리포지토리인 경우:**
- GitHub Pages는 Public 리포지토리 또는 GitHub Enterprise(유료) 필요
- 로컬에서 확인하는 것이 가장 간단: `open color-guide/index.html`

**Public 리포지토리인 경우:**
- GitHub Pages 사용 가능 (무료):
  1. GitHub 리포지토리 → **Settings** → **Pages**
  2. **Source**에서 `main` 브랜치 선택
  3. **Save** 클릭
  4. 몇 분 후 접근: `https://irang9.github.io/shared-scss/color-guide/`

자세한 내용은 `GITHUB_VIEW.md` 참고

### 생성 방법

이 파일은 `generate-theme-colors.py` 스크립트를 실행하여 자동 생성됩니다:

```bash
python3 color-guide/generate-theme-colors.py
```

또는

```bash
cd color-guide
./generate-theme-colors.py
```

### 자동화

#### 방법 1: macOS 서비스 (재부팅 후에도 자동 실행) ⭐⭐⭐ 추천

컴퓨터를 재부팅해도 자동으로 실행됩니다.

1. **watchdog 패키지 설치** (한 번만):

```bash
pip3 install watchdog
```

2. **서비스 설치** (한 번만):

```bash
./color-guide/install-service.sh
```

이제 색상 파일을 저장하면 자동으로 `index.html`이 생성되며, 컴퓨터를 재부팅해도 계속 작동합니다.

**서비스 관리:**
```bash
# 서비스 상태 확인
launchctl list | grep com.irang.shared-scss

# 로그 확인
tail -f /tmp/shared-scss-color-guide.log

# 서비스 중지
launchctl unload ~/Library/LaunchAgents/com.irang.shared-scss.color-guide.plist

# 서비스 제거
./color-guide/uninstall-service.sh
```

#### 방법 1-2: 파일 감시 (수동 실행, 재부팅 시 다시 실행 필요)

파일을 저장할 때마다 자동으로 HTML이 생성됩니다. (재부팅 후에는 다시 실행해야 함)

1. **watchdog 패키지 설치** (한 번만):

```bash
pip3 install watchdog
```

2. **감시 시작**:

```bash
./color-guide/start-watcher.sh
```

또는 직접:

```bash
python3 color-guide/watch-theme-colors.py
```

색상 파일(`variables/_colors.scss`, `theme/_index.scss`)을 저장하면 자동으로 `index.html`이 생성됩니다.

**백그라운드 실행:**
```bash
nohup python3 color-guide/watch-theme-colors.py > /dev/null 2>&1 &
```

#### 방법 2: Git Hook (Commit 시 자동화)

파일을 commit할 때 자동으로 HTML을 생성합니다.

`.git/hooks/pre-commit` 파일이 이미 생성되어 있습니다. (이미 설정됨)

색상 파일을 변경하고 commit하면 자동으로 `index.html`이 생성되고 함께 commit됩니다.

#### 방법 3: VS Code Task (수동 실행)

VS Code에서 수동으로 실행하려면:

`.vscode/tasks.json` 파일이 이미 생성되어 있습니다.

실행: `Cmd+Shift+P` → "Tasks: Run Task" → "Generate Theme Colors"

#### 방법 4: 수동 실행

필요한 경우 수동으로 실행:

```bash
python3 color-guide/generate-theme-colors.py
```

### 파일 구조

```
color-guide/
├── README.md                    # 이 파일
├── GITHUB_VIEW.md               # GitHub에서 보는 방법 가이드
├── generate-theme-colors.py     # HTML 생성 스크립트
├── watch-theme-colors.py        # 파일 감시 스크립트
├── start-watcher.sh             # 감시 시작 스크립트 (수동 실행용)
├── install-service.sh           # macOS 서비스 설치 스크립트
├── uninstall-service.sh         # macOS 서비스 제거 스크립트
├── com.irang.shared-scss.color-guide.plist  # macOS launchd 설정 파일
└── index.html                   # 생성된 HTML 파일 (자동 생성)
```

### 주의사항

- `index.html` 파일은 자동 생성되므로 직접 수정하지 마세요.
- 색상 파일(`variables/_colors.scss`, `theme/_index.scss`)을 수정한 후에는 스크립트를 실행하여 HTML을 업데이트하세요.
- Python 3.6 이상이 필요합니다.
