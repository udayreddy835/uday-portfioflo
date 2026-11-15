@echo off
title Sai Uday Reddy - Portfolio Server
echo ========================================================
echo Starting Sai Uday Reddy Portfolio Server (Python Flask)
echo ========================================================
echo.

:: Check for virtual environment
if exist "venv\Scripts\activate.bat" (
    echo Activating Python virtual environment (venv)...
    call venv\Scripts\activate.bat
)

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not found on your PATH.
    echo Please install Python 3 from https://python.org and check "Add Python to PATH".
    pause
    exit /b 1
)

echo Opening portfolio in your default browser...
start http://localhost:5000

echo Starting Flask backend...
python backend/app.py

pause
