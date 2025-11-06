#!/usr/bin/env python3
"""
Shared SCSS Theme Colors File Watcher
색상 파일이 변경될 때마다 자동으로 index.html을 생성합니다.
"""

import sys
import time
import subprocess
from pathlib import Path

# macOS/Linux용 (watchdog 패키지 필요)
try:
    from watchdog.observers import Observer
    from watchdog.events import FileSystemEventHandler
    WATCHDOG_AVAILABLE = True
except ImportError:
    WATCHDOG_AVAILABLE = False
    print("⚠️  watchdog 패키지가 설치되지 않았습니다.")
    print("   설치: pip3 install watchdog")
    print("   또는 Git pre-commit hook을 사용하세요.")
    sys.exit(1)


class ThemeColorsHandler(FileSystemEventHandler):
    """색상 파일 변경 감지 핸들러"""
    
    def __init__(self, script_path):
        self.script_path = script_path
        self.last_modified = 0
        self.debounce_time = 0.5  # 0.5초 debounce
    
    def on_modified(self, event):
        """파일 수정 이벤트 처리"""
        if event.is_directory:
            return
        
        # 색상 관련 파일만 처리
        if not event.src_path.endswith(('_colors.scss', '_index.scss')):
            return
        
        # Debounce: 너무 빠른 연속 수정 방지
        current_time = time.time()
        if current_time - self.last_modified < self.debounce_time:
            return
        self.last_modified = current_time
        
        print(f"\n🎨 변경 감지: {Path(event.src_path).name}")
        print("   index.html 생성 중...")
        
        try:
            # 스크립트 실행
            result = subprocess.run(
                [sys.executable, str(self.script_path)],
                capture_output=True,
                text=True,
                cwd=str(self.script_path.parent.parent)
            )
            
            if result.returncode == 0:
                print("   ✓ index.html이 업데이트되었습니다.\n")
            else:
                print(f"   ✗ 오류 발생:\n{result.stderr}\n")
        except Exception as e:
            print(f"   ✗ 오류: {e}\n")


def main():
    """메인 함수"""
    root_dir = Path(__file__).parent.parent
    script_path = root_dir / "color-guide" / "generate-theme-colors.py"
    watch_paths = [
        root_dir / "variables" / "_colors.scss",
        root_dir / "theme" / "_index.scss"
    ]
    
    # 감시할 디렉토리
    watch_dirs = [
        root_dir / "variables",
        root_dir / "theme"
    ]
    
    print("👀 색상 파일 감시 시작...")
    print("   감시 파일:")
    for path in watch_paths:
        print(f"   - {path.relative_to(root_dir)}")
    print("\n   Ctrl+C를 눌러 종료하세요.\n")
    
    # 이벤트 핸들러 생성
    event_handler = ThemeColorsHandler(script_path)
    
    # Observer 생성 및 시작
    observer = Observer()
    for watch_dir in watch_dirs:
        if watch_dir.exists():
            observer.schedule(event_handler, str(watch_dir), recursive=False)
    
    observer.start()
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n\n👋 감시를 종료합니다.")
        observer.stop()
    
    observer.join()


if __name__ == "__main__":
    main()

