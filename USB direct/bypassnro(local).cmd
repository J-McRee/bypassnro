@echo off
REM Script to copy unattend.xml from thumb drive and run Sysprep

REM Check if unattend.xml exists in the current directory
if not exist "%~dp0unattend.xml" (
    echo ERROR: unattend.xml not found in the current directory!
    echo Please ensure unattend.xml is on the thumb drive in the same folder as this script.
    pause
    exit /b 1
)

REM Copy unattend.xml to the Windows Panther directory
echo Copying unattend.xml to C:\Windows\Panther...
copy /Y "%~dp0unattend.xml" "C:\Windows\Panther\unattend.xml"

if %errorlevel% neq 0 (
    echo ERROR: Failed to copy unattend.xml
    pause
    exit /b 1
)

echo File copied successfully.
echo Running Sysprep...

REM Run Sysprep with the unattend file
%WINDIR%\System32\Sysprep\Sysprep.exe /oobe /unattend:C:\Windows\Panther\unattend.xml /reboot
