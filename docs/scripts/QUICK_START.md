# 빠른 시작 가이드

## 문제 해결

### 1. watchdog 패키지 설치

**macOS (externally-managed-environment 오류 시):**

```bash
python3 -m pip install --user --break-system-packages watchdog
```

또는

```bash
pip3 install --user --break-system-packages watchdog
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

### 2. 테스트 스크립트 실행 권한 부여

```bash
chmod +x docs/scripts/test-watcher.sh
```

### 3. 파일 감시 테스트

#### 방법 1: 수동 실행

```bash
# 터미널 1: 파일 감시 시작
cd /Users/irang/Github/rexbox
python3 docs/scripts/watch-theme-colors.py
```

다른 터미널에서 `rexbox/theme/_index.scss` 파일을 수정하고 저장하면 자동으로 문서가 생성됩니다.

#### 방법 2: 자동 테스트 스크립트

```bash
cd /Users/irang/Github/rexbox
./docs/scripts/test-watcher.sh
```

#### 방법 3: macOS 서비스로 설치 (백그라운드 실행)

```bash
cd /Users/irang/Github/rexbox
./docs/scripts/install-service.sh
```

서비스가 설치되면 컴퓨터를 재부팅해도 자동으로 실행됩니다.

## 확인 방법

### 서비스 상태 확인

```bash
launchctl list | grep com.rexbox.docs-watcher
```

### 로그 확인

```bash
tail -f /tmp/rexbox-docs-watcher.log
```

### 에러 로그 확인

```bash
tail -f /tmp/rexbox-docs-watcher-error.log
```

## 문제 해결

### watchdog 모듈이 없다는 오류

**macOS (externally-managed-environment 오류 시):**

```bash
python3 -m pip install --user watchdog
```

**일반적인 경우:**

```bash
pip3 install watchdog
```

### 권한 오류

```bash
chmod +x docs/scripts/*.sh
```

### 서비스가 작동하지 않을 때

1. 서비스 제거:
   ```bash
   ./docs/scripts/uninstall-service.sh
   ```

2. 수동 실행으로 테스트:
   ```bash
   python3 docs/scripts/watch-theme-colors.py
   ```

3. 문제가 해결되면 다시 설치:
   ```bash
   ./docs/scripts/install-service.sh
   ```

