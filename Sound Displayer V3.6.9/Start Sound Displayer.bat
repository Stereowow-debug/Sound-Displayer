@echo off
rem Opens Sound Displayer in its own window, using Edge or Chrome.
setlocal EnableDelayedExpansion
set "APP=%~dp0Sound Displayer.html"
if not exist "%APP%" goto missing

set "URL=file:///%APP:\=/%"
set "URL=!URL: =%%20!"

set "BROWSER="
for %%P in (
  "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
  "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
  "%ProgramFiles%\Google\Chrome\Application\chrome.exe"
  "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
  "%LocalAppData%\Google\Chrome\Application\chrome.exe"
) do if not defined BROWSER if exist %%P set "BROWSER=%%~P"

if not defined BROWSER goto fallback
start "" "%BROWSER%" --app="%URL%" --window-size=1100,860
goto :eof

:fallback
rem No Edge or Chrome found in the usual places: open with the default browser.
start "" "%APP%"
goto :eof

:missing
echo "Sound Displayer.html" must be in the same folder as this file.
pause
