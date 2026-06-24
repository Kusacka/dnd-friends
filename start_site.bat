@echo off
cd /d "%~dp0"
set "PORT=8000"
set "HOST=127.0.0.1"

where py >nul 2>&1
if not errorlevel 1 (
  start "Local Server" cmd /k "cd /d ""%~dp0"" && py -m http.server %PORT% --bind %HOST%"
) else (
  where python >nul 2>&1
  if not errorlevel 1 (
    start "Local Server" cmd /k "cd /d ""%~dp0"" && python -m http.server %PORT% --bind %HOST%"
  ) else (
    echo Python не найден. Установите Python и добавьте его в PATH.
    pause
    exit /b 1
  )
)

timeout /t 2 /nobreak >nul
start "" http://%HOST%:%PORT%

