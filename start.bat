@echo off
setlocal
cd /d "%~dp0"

set PORT=8765

rem Pick a Python launcher
where py >nul 2>nul && (set PY=py) || (where python >nul 2>nul && (set PY=python) || (set PY=))

if "%PY%"=="" (
  echo Python not found. Install Python from https://python.org or use the Launch preview panel.
  pause
  exit /b 1
)

start "" "http://localhost:%PORT%/index.html"
%PY% -m http.server %PORT%
