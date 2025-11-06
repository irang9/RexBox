# GitHub에서 HTML 파일 보기

GitHub에 올라간 `index.html`을 렌더링된 상태로 보는 방법입니다.

## ⚠️ Private 리포지토리인 경우

**Private 리포지토리에서는:**
- ❌ Raw 파일 URL 작동 안 함 (404 에러)
- ❌ HTML Preview 서비스 작동 안 함 (404 에러)
- ❌ GitHub Pages 무료 사용 불가 (Public 리포지토리 또는 GitHub Enterprise 필요)

**Private 리포지토리에서 HTML을 보는 방법:**

### 옵션 1: 리포지토리를 Public으로 변경 (무료)

리포지토리를 Public으로 변경하면 GitHub Pages를 무료로 사용할 수 있습니다:

1. GitHub 리포지토리 → **Settings** → **General** → **Danger Zone**
2. **Change repository visibility** → **Change visibility** → **Make public**
3. **Settings** → **Pages**로 이동
4. **Source**에서 "Deploy from a branch" 선택
5. **Branch**에서 `main` 브랜치 선택
6. **Folder**에서 `/docs` 선택
7. **Save** 클릭
8. 몇 분 후 접근: `https://irang9.github.io/shared-scss/`

### 옵션 2: GitHub Enterprise 사용 (유료)

GitHub Enterprise를 사용하면 Private 리포지토리에서도 Private GitHub Pages를 사용할 수 있습니다 (유료).

### 옵션 3: 로컬에서 확인

GitHub 없이 로컬에서 확인:

```bash
# HTML 파일을 직접 브라우저에서 열기
open docs/index.html
```

또는 로컬 서버 실행:

```bash
cd docs
python3 -m http.server 8000
# 브라우저에서 http://localhost:8000 접속
```

## 방법 1: GitHub Pages (Public 리포지토리인 경우) ⭐

**GitHub Pages는 Public 리포지토리에서만 무료로 사용 가능합니다.**

**설정 방법:**
1. GitHub 리포지토리에서 **Settings** → **Pages**로 이동
2. **Source**에서 "Deploy from a branch" 선택
3. **Branch**에서 `main` 브랜치 선택
4. **Folder**에서 `/docs` 선택
5. **Save** 클릭
6. 몇 분 후 다음 URL로 접근:
   ```
   https://irang9.github.io/shared-scss/
   ```

**장점:**
- 깔끔한 URL
- 공유하기 쉬움
- HTTPS 지원
- 무료 (Public 리포지토리인 경우)

## 방법 2: Public 리포지토리인 경우 (Raw 파일 URL)

리포지토리가 **Public**인 경우:

```
https://raw.githubusercontent.com/irang9/shared-scss/main/docs/index.html
```

**사용 방법:**
1. GitHub에서 `docs/index.html` 파일을 열기
2. "Raw" 버튼 클릭
3. 브라우저에서 HTML이 렌더링된 상태로 표시됨

## 방법 3: Public 리포지토리인 경우 (HTML Preview 서비스)

리포지토리가 **Public**인 경우:

1. **htmlpreview.github.io**:
   ```
   https://htmlpreview.github.io/?https://raw.githubusercontent.com/irang9/shared-scss/main/docs/index.html
   ```

2. **raw.githack.com**:
   ```
   https://raw.githack.com/irang9/shared-scss/main/docs/index.html
   ```

## 추천

**Private 리포지토리인 경우:**
- ✅ **로컬에서 확인** (옵션 3) - 가장 간단하고 안전
- 또는 리포지토리를 Public으로 변경 후 GitHub Pages 사용

**Public 리포지토리인 경우:**
- ✅ **GitHub Pages 사용** (방법 1) - 가장 깔끔함
- 또는 Raw 파일 URL 직접 접근 (방법 2)

