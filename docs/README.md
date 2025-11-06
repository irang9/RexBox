# RexBox 문서

이 디렉토리에는 RexBox 라이브러리의 모든 변수, mixins, 유틸리티 클래스를 확인할 수 있는 HTML 문서가 포함되어 있습니다.

## 📚 온라인 문서

**👉 [온라인 문서 보기](https://irang9.github.io/rexbox/)** (GitHub Pages)

문서에서 모든 변수, mixins, 유틸리티 클래스를 확인할 수 있습니다.

## 📄 문서 파일

이 디렉토리에는 다음 HTML 문서 파일들이 포함되어 있습니다:

- **index.html**: 문서 홈페이지
- **colors.html**: 색상 변수 문서
- **typography.html**: 타이포그래피 문서
- **fonts.html**: 폰트 변수 및 Material Icons 문서
- **breakpoints.html**: Breakpoint 변수 및 mixins 문서
- **spacing.html**: Spacing 변수 문서
- **borders.html**: Border 유틸리티 문서
- **stacks.html**: Stacks 유틸리티 문서
- **vertical-rule.html**: Vertical Rule 유틸리티 문서
- **mixins.html**: Mixins 문서

이 문서들은 `generate-docs.py` 스크립트를 실행하여 자동 생성됩니다.

## 🔧 문서 생성

### 자동 생성

문서는 `scripts/generate-docs.py` 스크립트를 실행하여 자동 생성됩니다:

```bash
cd docs
python3 scripts/generate-docs.py
```

이 스크립트는 `rexbox/` 디렉토리의 SCSS 파일을 파싱하여 모든 HTML 문서를 생성합니다.

### GitHub Pages 설정

**Public 리포지토리인 경우:**
- GitHub Pages 사용 가능 (무료):
  1. GitHub 리포지토리 → **Settings** → **Pages**
  2. **Source**에서 "Deploy from a branch" 선택
  3. **Branch**에서 `main` 브랜치 선택
  4. **Folder**에서 `/docs` 선택
  5. **Save** 클릭
  6. 몇 분 후 접근: `https://irang9.github.io/rexbox/`

**Private 리포지토리인 경우:**
- GitHub Pages는 Public 리포지토리 또는 GitHub Enterprise(유료) 필요
- 로컬에서 확인: `open docs/index.html`

자세한 내용은 `GITHUB_VIEW.md` 참고

## 📝 문서 업데이트

`rexbox/` 디렉토리의 SCSS 파일을 수정한 후, 문서를 업데이트하려면:

```bash
cd docs
python3 scripts/generate-docs.py
```

문서는 자동으로 `rexbox/` 디렉토리의 SCSS 파일을 파싱하여 생성되므로, SCSS 코드를 수정하면 문서도 함께 업데이트됩니다.

## 🎨 색상 가이드 자동화 (선택사항)

색상 팔레트 문서(`index.html`)를 자동으로 생성하려면 `scripts/generate-theme-colors.py` 스크립트를 사용할 수 있습니다.

### 자동화 방법

#### 방법 1: macOS 서비스 (재부팅 후에도 자동 실행) ⭐⭐⭐ 추천

컴퓨터를 재부팅해도 자동으로 실행됩니다.

1. **watchdog 패키지 설치** (한 번만):

   **macOS (externally-managed-environment 오류 시):**
   ```bash
   python3 -m pip install --user --break-system-packages watchdog
   ```
   
   **또는 가상환경 사용 (권장):**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   pip install watchdog
   ```

   **일반적인 경우:**
   ```bash
   pip3 install watchdog
   ```

2. **서비스 설치** (한 번만):

```bash
./docs/scripts/install-service.sh
```

이제 색상 파일을 저장하면 자동으로 `index.html`이 생성되며, 컴퓨터를 재부팅해도 계속 작동합니다.

**서비스 관리:**
```bash
# 서비스 상태 확인
launchctl list | grep com.rexbox.docs-watcher

# 로그 확인
tail -f /tmp/rexbox-docs-watcher.log

# 서비스 중지
launchctl unload ~/Library/LaunchAgents/com.rexbox.docs-watcher.plist

# 서비스 제거
./docs/scripts/uninstall-service.sh
```

#### 방법 2: 파일 감시 (수동 실행)

파일을 저장할 때마다 자동으로 HTML이 생성됩니다.

1. **watchdog 패키지 설치** (한 번만):

   **macOS (externally-managed-environment 오류 시):**
   ```bash
   python3 -m pip install --user --break-system-packages watchdog
   ```
   
   **또는 가상환경 사용 (권장):**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   pip install watchdog
   ```

   **일반적인 경우:**
   ```bash
   pip3 install watchdog
   ```

2. **감시 시작**:

```bash
./docs/scripts/start-watcher.sh
```

또는 직접:

```bash
python3 docs/scripts/watch-theme-colors.py
```

색상 파일(`variables/_colors.scss`, `theme/_index.scss`)을 저장하면 자동으로 `index.html`이 생성됩니다.

#### 방법 3: 수동 실행

필요한 경우 수동으로 실행:

```bash
python3 docs/scripts/generate-theme-colors.py
```

## 📁 파일 구조

```
docs/
├── README.md                    # 이 파일
├── GITHUB_VIEW.md               # GitHub에서 보는 방법 가이드
├── scripts/                     # 스크립트 파일들
│   ├── generate-docs.py         # 전체 문서 생성 스크립트 (메인)
│   ├── generate-theme-colors.py # 색상 가이드 HTML 생성 스크립트
│   ├── watch-theme-colors.py    # 색상 파일 감시 스크립트
│   ├── create-favicon.py        # Favicon 생성 스크립트
│   ├── start-watcher.sh         # 감시 시작 스크립트 (수동 실행용)
│   ├── install-service.sh       # macOS 서비스 설치 스크립트
│   ├── uninstall-service.sh     # macOS 서비스 제거 스크립트
│   └── com.rexbox.docs-watcher.plist  # macOS launchd 설정 파일
├── assets/                      # 정적 파일들
│   ├── favicon.ico              # Favicon (ICO)
│   └── favicon.png              # Favicon (PNG)
├── index.html                   # 문서 홈페이지 (자동 생성)
├── colors.html                  # 색상 변수 문서 (자동 생성)
├── typography.html              # 타이포그래피 문서 (자동 생성)
├── fonts.html                   # 폰트 변수 문서 (자동 생성)
├── breakpoints.html             # Breakpoint 문서 (자동 생성)
├── spacing.html                 # Spacing 문서 (자동 생성)
├── borders.html                 # Border 유틸리티 문서 (자동 생성)
├── stacks.html                  # Stacks 유틸리티 문서 (자동 생성)
├── vertical-rule.html           # Vertical Rule 유틸리티 문서 (자동 생성)
└── mixins.html                  # Mixins 문서 (자동 생성)
```

## ⚠️ 주의사항

- HTML 문서 파일들은 자동 생성되므로 직접 수정하지 마세요.
- `rexbox/` 디렉토리의 SCSS 파일을 수정한 후에는 `scripts/generate-docs.py` 스크립트를 실행하여 문서를 업데이트하세요.
- Python 3.6 이상이 필요합니다.

## 📖 더 알아보기

- [RexBox README](../README.md) - 프로젝트 전체 개요
- [RexBox 상세 문서](../rexbox/README.md) - 라이브러리 상세 설명
- [Sample Project](../sample-project/README.md) - 사용 예제
