@echo off
cd /d "%~dp0"
git status
git add .
git commit -m "Update site"
git push
pause