@echo off
setlocal

echo Installing required Python packages...

REM Path to bundled Python
set PYTHON=Python\Python\python.exe

REM Check if Python exists
if not exist "%PYTHON%" (
    echo Python not found at %PYTHON%
    echo Please run download_python.bat first.
    pause
    exit /b
)

REM Upgrade pip
"%PYTHON%" -m pip install --upgrade pip

REM Install required packages
"%PYTHON%" -m pip install gradio

echo.
echo All packages installed successfully.
echo You can now run the app.
pause
endlocal
