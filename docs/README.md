# RexBox 문서

RexBox 라이브러리의 모든 변수, mixins, 유틸리티 클래스를 확인할 수 있는 HTML 문서입니다.

**이 문서 사이트는 RexBox의 사양서 역할을 하며, 동시에 개별 프로젝트 예제 역할도 겸합니다.** 문서 사이트 자체가 RexBox 클래스를 사용하여 구성되어 있어, 문서를 보면서 동시에 실제 사용 예시를 확인할 수 있습니다.

## 📚 온라인 문서

**👉 [온라인 문서 보기](https://irang9.github.io/rexbox/)** (GitHub Pages)

## 📄 문서 페이지

다음 HTML 문서들이 자동 생성됩니다:

- **index.html** - 문서 홈페이지
- **theme.html** - 색상 변수 및 테마 색상
- **typography.html** - 타이포그래피 변수
- **fonts.html** - 폰트 변수 및 Material Icons
- **breakpoints.html** - Breakpoint 변수 및 mixins
- **spacing.html** - Spacing 변수
- **width.html** - Width 유틸리티
- **container.html** - Container / Row 레이아웃
- **borders.html** - Border 유틸리티 클래스
- **buttons.html** - Button 유틸리티 클래스
- **stacks.html** - Stacks 유틸리티 클래스
- **vertical-rule.html** - Vertical Rule 유틸리티 클래스
- **mixins.html** - Mixins
- **responsive.html** - Responsive 유틸리티 (mobile/desktop 접두사)
- **sample.html** - 테스트용 샘플 페이지

## 🔧 문서 생성

### 수동 생성

```bash
cd docs
python3 scripts/generate-docs.py
```

이 스크립트는 `rexbox/` 디렉토리의 SCSS 파일을 파싱하여 모든 HTML 문서를 생성합니다.

### 자동 생성 (파일 감시)

SCSS 파일을 수정하면 자동으로 문서가 생성됩니다.

#### 방법 1: macOS 서비스 (백그라운드 실행) ⭐ 추천

컴퓨터를 재부팅해도 자동으로 실행됩니다.

1. **watchdog 패키지 설치:**

   **macOS:**
   ```bash
   python3 -m pip install --user --break-system-packages watchdog
   ```
   
   **가상환경 사용 (권장):**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   pip install watchdog
   ```

2. **서비스 설치:**
   ```bash
   ./docs/scripts/install-service.sh
   ```

**서비스 관리:**
```bash
# 서비스 상태 확인
launchctl list | grep com.rexbox.docs-watcher

# 로그 확인
tail -f /tmp/rexbox-docs-watcher.log

# 서비스 제거
./docs/scripts/uninstall-service.sh
```

#### 방법 2: 수동 실행

터미널에서 파일 감시를 시작합니다:

```bash
# watchdog 패키지 설치 (위 참고)

# 파일 감시 시작
python3 docs/scripts/watch-theme-colors.py
```

또는:

```bash
./docs/scripts/start-watcher.sh
```

SCSS 파일을 저장하면 자동으로 모든 문서 페이지가 생성됩니다.

## 📁 파일 구조

```
docs/
├── README.md                    # 이 파일
├── scripts/                     # 스크립트 파일들
│   ├── generate-docs.py         # 문서 생성 스크립트 (메인)
│   ├── watch-theme-colors.py    # SCSS 파일 감시 스크립트
│   ├── create-favicon.py        # Favicon 생성 스크립트
│   ├── start-watcher.sh         # 감시 시작 스크립트
│   ├── install-service.sh       # macOS 서비스 설치
│   ├── uninstall-service.sh     # macOS 서비스 제거
│   └── com.rexbox.docs-watcher.plist  # macOS launchd 설정
├── scss/                        # 문서 사이트 전용 SCSS
│   ├── main.scss                # 메인 스타일 파일
│   ├── _config.scss             # 문서 사이트 설정
│   └── components/              # 문서 컴포넌트 스타일
├── css/                         # 컴파일된 CSS (Git에 포함)
│   └── main.css
├── assets/                      # 정적 파일들
│   ├── favicon.ico
│   └── favicon.png
└── *.html                       # 자동 생성된 문서 파일들
```

## ⚠️ 주의사항

- HTML 문서 파일들은 자동 생성되므로 **직접 수정하지 마세요**
- SCSS 파일을 수정한 후에는 문서를 재생성하세요
- Python 3.6 이상이 필요합니다

## 📖 더 알아보기

- [RexBox README](../README.md) - 프로젝트 전체 개요
- [RexBox 상세 문서](../rexbox/README.md) - 라이브러리 상세 설명
