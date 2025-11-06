# 설치 가이드

## watchdog 패키지 설치

### macOS (externally-managed-environment 오류 시)

최신 macOS에서는 `--break-system-packages` 플래그가 필요할 수 있습니다:

**방법 1: --break-system-packages 사용**

```bash
python3 -m pip install --user --break-system-packages watchdog
```

또는

```bash
pip3 install --user --break-system-packages watchdog
```

**방법 2: 가상환경 사용 (권장)**

```bash
# 가상환경 생성
python3 -m venv venv

# 가상환경 활성화
source venv/bin/activate

# watchdog 설치
pip install watchdog
```

가상환경을 활성화한 상태에서 스크립트를 실행하면 됩니다.

### 일반적인 경우

```bash
pip3 install watchdog
```

또는

```bash
python3 -m pip install watchdog
```

## 설치 확인

```bash
python3 -c "import watchdog; print('✅ watchdog 설치 완료')"
```

## 문제 해결

### externally-managed-environment 오류

이 오류는 시스템 Python을 보호하기 위한 것입니다. `--user` 플래그를 사용하면 사용자 디렉토리에 설치되어 시스템 Python을 건드리지 않습니다.

### 다른 해결 방법

1. **가상환경 사용:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   pip install watchdog
   ```

2. **pipx 사용:**
   ```bash
   brew install pipx
   pipx install watchdog
   ```

3. **Homebrew로 설치 (권장하지 않음):**
   ```bash
   brew install watchdog
   ```

## 참고

- `--user` 플래그를 사용하면 패키지가 `~/.local/lib/python3.x/site-packages`에 설치됩니다.
- 이 방법은 시스템 Python을 건드리지 않으므로 안전합니다.
- 대부분의 경우 `--user` 플래그를 사용하는 것이 가장 간단한 해결 방법입니다.

