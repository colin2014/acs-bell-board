@echo off
REM  ACS Egham bell board - kiosk launcher
REM  Opens the board full screen with no tabs or address bar.
REM  Press Alt+F4 to close it.

set "PAGE=%~dp0index.html"

set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%BROWSER%" set "BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not exist "%BROWSER%" set "BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not exist "%BROWSER%" set "BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

if not exist "%BROWSER%" (
  echo Could not find Chrome or Edge. Opening in your default browser instead.
  start "" "%PAGE%"
  exit /b
)

start "" "%BROWSER%" --kiosk --allow-file-access-from-files --autoplay-policy=no-user-gesture-required "file:///%PAGE:\=/%"
