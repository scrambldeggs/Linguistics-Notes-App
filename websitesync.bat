@echo off
powershell -sta -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; $result = [System.Windows.Forms.MessageBox]::Show('Sync the website now?', 'Confirm Sync', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"
if errorlevel 1 goto :cancel

D:
cd "D:\USER\Documents\Linguistics-Notes-App"
call npx quartz sync
pause
goto :eof

:cancel
echo Sync cancelled.
pause