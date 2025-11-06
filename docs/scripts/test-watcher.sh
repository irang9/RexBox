#!/bin/bash
# 파일 감시 스크립트 테스트

echo "🧪 RexBox 문서 자동화 테스트"
echo ""

# 프로젝트 루트로 이동
cd "$(dirname "$0")/../.."

# watchdog 모듈 확인
echo "1. watchdog 모듈 확인..."
python3 -c "import watchdog" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "   ❌ watchdog 모듈이 설치되지 않았습니다."
    echo "   설치: pip3 install watchdog"
    exit 1
fi
echo "   ✅ watchdog 모듈 OK"
echo ""

# 경로 확인
echo "2. 경로 확인..."
python3 -c "
from pathlib import Path
script = Path('docs/scripts/watch-theme-colors.py').resolve()
root = script.parent.parent.parent / 'rexbox'
print(f'   Script: {script}')
print(f'   Root (rexbox/rexbox): {root}')
print(f'   Root exists: {root.exists()}')
print()
print('   Watch directories:')
for d in ['variables', 'theme', 'breakpoints', 'mixins', 'fonts', 'utilities']:
    watch_dir = root / d
    exists = '✅' if watch_dir.exists() else '❌'
    print(f'     {exists} {d}: {watch_dir}')
"
echo ""

# 문서 생성 스크립트 테스트
echo "3. 문서 생성 스크립트 테스트..."
cd docs
python3 scripts/generate-docs.py > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "   ✅ 문서 생성 스크립트 OK"
else
    echo "   ❌ 문서 생성 스크립트 실패"
    exit 1
fi
echo ""

# 파일 감시 스크립트 시작 (백그라운드)
echo "4. 파일 감시 스크립트 시작..."
cd ..
python3 docs/scripts/watch-theme-colors.py &
WATCHER_PID=$!
echo "   ✅ 파일 감시 시작 (PID: $WATCHER_PID)"
echo ""

# 테스트 파일 수정
echo "5. 테스트 파일 수정..."
TEST_FILE="rexbox/theme/_index.scss"
if [ -f "$TEST_FILE" ]; then
    # 파일에 주석 추가 (이미 있으면 무시)
    if ! grep -q "TEST COMMENT" "$TEST_FILE"; then
        echo "   // TEST COMMENT - $(date)" >> "$TEST_FILE"
        echo "   ✅ 테스트 주석 추가됨"
        sleep 2
        # 주석 제거
        sed -i '' '/TEST COMMENT/d' "$TEST_FILE"
        echo "   ✅ 테스트 주석 제거됨"
    else
        echo "   ⚠️  테스트 주석이 이미 있습니다"
    fi
else
    echo "   ❌ 테스트 파일을 찾을 수 없습니다: $TEST_FILE"
fi
echo ""

# 로그 확인
echo "6. 로그 확인 (5초 대기)..."
sleep 5
echo ""

# 프로세스 종료
echo "7. 파일 감시 프로세스 종료..."
kill $WATCHER_PID 2>/dev/null
wait $WATCHER_PID 2>/dev/null
echo "   ✅ 프로세스 종료됨"
echo ""

echo "✅ 테스트 완료!"
echo ""
echo "💡 다음 단계:"
echo "   - macOS 서비스 설치: ./docs/scripts/install-service.sh"
echo "   - 수동 실행: python3 docs/scripts/watch-theme-colors.py"

