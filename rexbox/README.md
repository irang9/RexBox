# RexBox

이 디렉토리는 RexBox SCSS 라이브러리의 메인 코드가 들어있는 디렉토리입니다.

## 📁 디렉토리 구조

```
rexbox/
├── variables/         # 변수 (colors, typo, spacing)
├── breakpoints/       # Breakpoint 변수와 mixins
├── theme/             # 의미 색상 (semantic colors)
├── mixins/            # Mixins
├── fonts/             # 기본 폰트 파일 (Spoqa, Material Icons)
├── base/              # 기본 스타일 (reset, forms)
├── utilities/         # 유틸리티 클래스
└── _index.scss        # 메인 진입점
```

## 🚀 사용 방법

### 전체 라이브러리 사용

```scss
// 프로젝트의 SCSS 파일에서
@use '../rexbox/rexbox' as *;
```

### 선택적 사용

```scss
// 필요한 것만 선택적으로
@use '../rexbox/rexbox/variables' as *;
@use '../rexbox/rexbox/breakpoints' as *;
@use '../rexbox/rexbox/theme' as *;
@use '../rexbox/rexbox/mixins' as *;
```

## 📖 상세 문서

전체 프로젝트 개요와 사용 방법은 [프로젝트 루트 README](../README.md)를 참고하세요.

온라인 문서: [https://irang9.github.io/rexbox/](https://irang9.github.io/rexbox/)
