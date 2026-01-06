@echo off
setlocal

echo Installing Microsoft Visual C++ Redistributable (x64)...

set URL=https://aka.ms/vs/17/release/vc_redist.x64.exe
set EXE=vc_redist.x64.exe

REM Download installer
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%EXE%'"

if not exist "%EXE%" (
    echo Failed to download Visual C++ Redistributable.
    pause
    exit /b
)

REM Silent install
"%EXE%" /install /quiet /norestart

echo.
echo Visual C++ Redistributable installed.
echo Please RESTART the terminal or system if needed.
pause
endlocal
