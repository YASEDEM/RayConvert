@echo off
setlocal
where python >nul 2>nul
if errorlevel 1 goto no_python
python -c "import sys; sys.exit(0 if sys.version_info[:2] == (3, 12) else 1)"
if errorlevel 1 goto wrong_version
where pythonw >nul 2>nul
if errorlevel 1 goto console
start "RayConvert" pythonw "%~dp0rayconvert.py"
exit /b 0
:console
python "%~dp0rayconvert.py"
exit /b %errorlevel%
:no_python
echo Python 3.12 was not found.
pause
exit /b 1
:wrong_version
echo RayConvert requires Python 3.12.
pause
exit /b 1

