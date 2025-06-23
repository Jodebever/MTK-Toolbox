ECHO OFF
CLS

setlocal
title MTK Toolbox

color 1F
echo(
echo ================== All-in-one MTK Toolbox - v1.0 ==================
echo ======================== By Noah Domingues ========================
echo(
echo ------- More useful tools: https://github.com/NoahDomingues -------
echo(
echo ---------- Discord Server: https://discord.gg/3zbfaTNN7V ----------
echo(

REM -------------------------------
REM Step 1: Extract bin.zip into the "bin" folder
REM -------------------------------
if exist bin.zip (
    title MTK Toolbox - Extracting...
    echo Extracting files...
    powershell -Command "Expand-Archive -Force 'bin.zip' -DestinationPath 'bin'"
    if %errorlevel% neq 0 (
        title MTK Toolbox - Extraction Failed
        echo ERROR: Failed to extract bin.zip. Join our Discord server for assistance: https://discord.gg/3zbfaTNN7V
        pause
        exit /b %errorlevel%
    )
    attrib +h "bin"
    title MTK Toolbox - Extraction Complete
    echo Extraction complete.
) else (
    title MTK Toolbox - Extraction Failed
    echo ERROR: bin.zip not found. Join our Discord server for assistance: https://discord.gg/3zbfaTNN7V
    pause
    exit /b 1
)

REM -------------------------------
REM Step 2: Delete bin.zip after extraction
REM -------------------------------
del bin.zip /f
title MTK Toolbox
cls

:MENU
cls
echo.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=  __  __ _____ _  __  _____           _ _                                " < NUL & echo/
set /P "= |  \/  |_   _| |/ / |_   _|__   ___ | | |__   _____  __                " < NUL & echo/
set /P "= | |\/| | | | | ' /    | |/ _ \ / _ \| | '_ \ / _ \ \/ /                " < NUL & echo/
set /P "= | |  | | | | | . \    | | (_) | (_) | | |_) | (_) >  <                 " < NUL & echo/
set /P "= |_|  |_| |_| |_|\_\   |_|\___/ \___/|_|_.__/ \___/_/\_\               " < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
echo.
echo DISCORD SERVER: https://discord.gg/3zbfaTNN7V
echo.
echo 1 - MediaTek ROM Porter
echo 2 - Android IMG Editor
echo 3 - TWRP Recovery Builder (Online)
echo 4 - Exit
echo.
set /p M=Select an option:

if "%M%"=="1" goto ROMPORTER
if "%M%"=="2" goto IMGEDITOR
if "%M%"=="3" goto OPENLINK
if "%M%"=="4" exit
goto MENU

:ROMPORTER
cls
echo Launching MediaTek ROM Porter...
start "" "%~dp0bin\MTK ROM Porter.exe"
timeout /t 2 >nul
goto MENU

:IMGEDITOR
cls
echo Launching Android IMG Editor...
start "" "%~dp0bin\Android IMG Editor.exe"
timeout /t 2 >nul
goto MENU

:OPENLINK
cls
echo Opening TWRP Recovery Builder in your browser...
start https://github.com/NoahDomingues/Auto-TWRP-Builder
timeout /t 2 >nul
goto MENU
