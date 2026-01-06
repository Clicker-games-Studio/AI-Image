@echo off
setlocal

echo Installing Python dependencies...

REM Path to bundled Python
set PYTHON=Python\Python\python.exe

if not exist "%PYTHON%" (
    echo Python not found. Run download_python.bat first.
    pause
    exit /b
)

echo Upgrading pip...
"%PYTHON%" -m pip install --upgrade pip setuptools wheel

echo Installing core dependencies...
"%PYTHON%" -m pip install gradio pillow numpy

echo Installing PyTorch (CPU version)...
"%PYTHON%" -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

echo.
echo All dependencies installed successfully.
echo You can now run the app.
pause
endlocal
