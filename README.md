# RexBox

여러 프로젝트에서 공통으로 사용하는 SCSS 변수, mixins, 유틸리티 클래스 라이브러리입니다.

## 📚 온라인 문서

**👉 [온라인 문서 보기](https://irang9.github.io/rexbox/)** (GitHub Pages)

문서에서 모든 변수, mixins, 유틸리티 클래스를 확인할 수 있습니다.

## 📁 프로젝트 구조

이 저장소는 다음과 같은 구조로 구성되어 있습니다:

```
rexbox/
├── rexbox/           # SCSS 라이브러리 (메인)
│   ├── variables/    # 변수 (colors, typo, spacing)
│   ├── breakpoints/  # Breakpoint 변수와 mixins
│   ├── theme/        # 의미 색상 (semantic colors)
│   ├── mixins/       # Mixins
│   ├── fonts/        # 기본 폰트 파일 (Spoqa, Material Icons)
│   ├── base/         # 기본 스타일 (reset, forms)
│   ├── utilities/    # 유틸리티 클래스
│   ├── _index.scss   # 메인 진입점
│   └── README.md     # 상세 문서
├── docs/             # 문서 (HTML) - 개별 프로젝트 예제 역할도 겸함
│   ├── index.html
│   ├── theme.html
│   ├── typography.html
│   ├── breakpoints.html
│   ├── spacing.html
│   ├── borders.html
│   ├── buttons.html
│   ├── stacks.html
│   ├── vertical-rule.html
│   ├── mixins.html
│   ├── scripts/          # 문서 생성 스크립트
│   └── assets/           # 정적 파일 (favicon 등)
└── README.md         # 이 파일
```

## 📂 디렉토리 설명

### `rexbox/` - SCSS 라이브러리

실제 SCSS 라이브러리 코드가 들어있는 디렉토리입니다. 다른 프로젝트에서 이 디렉토리를 참조하여 사용합니다.

**주요 내용:**
- **variables/**: 색상, 타이포그래피, spacing 등 변수 정의
- **breakpoints/**: 반응형 디자인을 위한 breakpoint 변수와 mixins
- **theme/**: 의미 색상 (primary, secondary, success 등)
- **mixins/**: 재사용 가능한 SCSS mixins
- **fonts/**: 기본 폰트 파일 (Spoqa, Material Icons) - 선택적 폰트는 프로젝트별로 관리
- **base/**: 기본 스타일 (reset, forms)
- **utilities/**: 유틸리티 클래스 (Bootstrap 스타일)

자세한 내용은 [`rexbox/README.md`](./rexbox/README.md)를 참고하세요.

### `docs/` - 문서 및 예제

HTML 형식의 문서가 들어있는 디렉토리입니다. GitHub Pages를 통해 온라인으로 제공되며, **개별 프로젝트 예제 역할도 겸합니다**. 문서 사이트 자체가 RexBox 클래스를 사용한 실제 예제로 구성되어 있어, 문서를 보면서 동시에 실제 사용 예시를 확인할 수 있습니다.

**주요 내용:**
- **index.html**: 문서 홈페이지
- **theme.html**: 색상 변수 및 테마 색상
- **typography.html**: 타이포그래피 변수
- **fonts.html**: 폰트 변수 및 Material Icons
- **breakpoints.html**: Breakpoint 문서
- **spacing.html**: Spacing 문서
- **borders.html**: Border 유틸리티 문서
- **buttons.html**: Button 유틸리티 문서
- **stacks.html**: Stacks 유틸리티 문서
- **vertical-rule.html**: Vertical Rule 유틸리티 문서
- **mixins.html**: Mixins 문서
- **responsive.html**: Responsive 유틸리티 문서
- **scripts/**: 문서 생성 스크립트 디렉토리

자세한 내용은 [`docs/README.md`](./docs/README.md)를 참고하세요.

## 🚀 빠른 시작

### 1. 저장소 클론

```bash
git clone https://github.com/irang9/rexbox.git
cd rexbox
```

### 2. 다른 프로젝트에서 사용

#### 방법 A: Git 서브모듈로 추가 (권장)

```bash
# 프로젝트 디렉토리에서
git submodule add https://github.com/irang9/rexbox.git rexbox
```

#### 방법 B: 직접 복사

```bash
# rexbox/rexbox 디렉토리를 프로젝트에 복사
cp -r rexbox/rexbox /path/to/your/project/
```

### 3. SCSS 파일에서 사용

```scss
// 프로젝트의 SCSS 파일에서
@use '../rexbox/rexbox' as *;

// 또는 필요한 것만 선택적으로
@use '../rexbox/rexbox/variables' as *;
@use '../rexbox/rexbox/breakpoints' as *;
@use '../rexbox/rexbox/theme' as *;
@use '../rexbox/rexbox/mixins' as *;
```

### 4. 프로젝트별 커스터마이징

프로젝트별 설정 파일(`_config.scss`)을 만들어 색상 등을 오버라이드할 수 있습니다:

```scss
// _config.scss
@use '../rexbox/rexbox/variables' as *;
@use '../rexbox/rexbox/breakpoints' as *;

// Primary 색상 오버라이드
$primary: #ff6b6b;
$secondary: #4ecdc4;

// Theme import (위에서 정의한 변수가 기본값을 덮어씁니다)
@use '../rexbox/rexbox/theme' as *;
```

#### 폰트 커스터마이징

프로젝트별 선택적 폰트는 프로젝트의 `fonts/` 디렉토리에서 관리합니다:

```scss
// 프로젝트의 fonts/_gmarket.scss
@font-face {
    font-family: 'GmarketSans';
    src: url('...') format('woff');
}

// _config.scss
$font-gmarket: "GmarketSans", "Spoqa Han Sans Neo", ...;

// main.scss
@use 'fonts/gmarket' as *;
```

**참고:** RexBox는 기본 폰트(`$font-basic`, `$font-monospace`)와 Material Icons만 제공합니다. 선택적 폰트는 프로젝트별로 다를 수 있으므로 각 프로젝트에서 관리합니다.

## ✨ 주요 기능

### Variables (변수)
- **Colors**: Tailwind 기반 색상 팔레트
- **Typography**: Font-size, font-weight, rem 함수
- **Spacing**: Margin, padding, gap 변수

### Breakpoints
- Bootstrap 5 표준과 일치하는 breakpoint
- Mobile First / Desktop First mixins
- `@include up("md")`, `@include down("md")`, `@include between("xs", "lg")`

### Theme (의미 색상)
- Semantic color variables (`$primary`, `$secondary`, `$success` 등)
- Background, text, border 색상
- 프로젝트별 오버라이드 가능
- Semantic Name과 Step Value 통합 제공 (예: `$primary` = `$primary-600`, `$slate` = `$slate-500`)

### Mixins
- `rounded`: Border-radius mixins (Bootstrap 스타일)
- `transition`: Transition 효과
- `transform`: Transform 효과
- `ellipsis`: 텍스트 말줄임
- 기타 유용한 mixins

### Fonts (폰트)
- **기본 폰트**: `$font-basic`, `$font-monospace` (Spoqa Han Sans Neo 기반)
- **Material Icons**: Google Material Icons 자동 포함
- **선택적 폰트**: 프로젝트별 `fonts/` 디렉토리에서 관리 (Gmarket, Google Fonts 등)

### Utilities (유틸리티 클래스)
- **Borders**: Border 추가/제거, width, color, radius, opacity. 단계별 색상 지원 (`.border-slate-200`, `.border-primary-500` 등)
- **Buttons**: Bootstrap 스타일의 버튼 유틸리티. Solid, Outline, Ghost variants 및 단계별 색상 지원
- **Colors**: 
  - Semantic 색상: `.text-*`, `.bg-*`, `.bg-*-subtle`, `.text-bg-*` 등
  - 단계별 색상: `.bg-slate-200`, `.text-primary-600`, `.border-secondary-300` 등 (Slate, Primary, Secondary, Point)
- **Display**: Display 유틸리티
- **Flex**: Flexbox 유틸리티
- **Width**: `.w-25`, `.w-50`, `.w-100`, `.w-fit`, `.w-max` 등 백분율/콘텐츠 기반 너비
- **Container**: `.container`, `.container-fluid`, `.row` 등 경량 레이아웃 구조
- **Spacing**: Margin, padding, gap
- **Stacks**: `.vstack`, `.hstack` (Bootstrap 스타일)
- **Lists**: `.list-unstyled`, `.list-inline` (Bootstrap 스타일)
- **Vertical Rule**: `.vr` (수직 구분선)
- **Text**: Typography 유틸리티
- **Responsive**: `.mobile-only`, `.desktop-flex-row`, `.mobile-vstack` 등 반응형 접두사 유틸리티

## 📖 더 알아보기

- **[온라인 문서](https://irang9.github.io/rexbox/)** - 모든 변수와 설정값 확인
- **[RexBox 상세 문서](./rexbox/README.md)** - 라이브러리 상세 설명
- **[Docs README](./docs/README.md)** - 문서 및 예제 프로젝트 설명

## 🔧 문서 업데이트

`rexbox/` 디렉토리의 SCSS 파일을 수정한 후, 문서를 업데이트하려면:

```bash
cd docs
python3 scripts/generate-docs.py
```

문서는 자동으로 `rexbox/` 디렉토리의 SCSS 파일을 파싱하여 생성되므로, SCSS 코드를 수정하면 문서도 함께 업데이트됩니다.

## 📝 라이선스

MIT License

## 🤝 기여

이슈와 풀 리퀘스트를 환영합니다!
