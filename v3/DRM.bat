@echo off
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'DRM - by Drev', 'DRM CLI Loaded.', [System.Windows.Forms.ToolTipIcon]::None)}"
:eof
title DRM - by Drev
mode 80, 31
chcp 65001 >nul
goto banner

:banner
echo.
echo.
echo                         [38;5;21m██████╗ ██████╗ ███╗   ███╗
echo                         [38;5;27m██╔══██╗██╔══██╗████╗ ████║
echo                         [38;5;33m██║  ██║██████╔╝██╔████╔██║
echo                         [38;5;39m██║  ██║██╔══██╗██║╚██╔╝██║
echo                         [38;5;45m██████╔╝██║  ██║██║ ╚═╝ ██║
echo                         [38;5;201╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝                                                                          
echo.
echo.
echo                  ╔
echo                  ║
echo                  ╠ 1) 1920 x 1080
echo                  ║
echo                  ╠ 2) 1366 x 768
echo                  ║
echo                  ╠ 3) 1024 x 768
echo                  ║
echo                  ╠ 4) 800 x 600
echo                  ║
echo                  ╠ 5) 640 x 480
echo                  ║
echo                  ╠ 6) Custom Resolution
echo                  ║
echo                  ╠ 7) Exit
echo                  ║
set /p choice=.                ╚   
echo.

if "%choice%"=="1" call :changeRes 1920 1080
if "%choice%"=="2" call :changeRes 1366 768
if "%choice%"=="3" call :changeRes 1024 768
if "%choice%"=="4" call :changeRes 800 600
if "%choice%"=="5" call :changeRes 640 480
if "%choice%"=="6" call :customRes
if "%choice%"=="7" exit

goto :main

:: If the input is invalid, show an error message and go back to menu
cls
echo.
echo.
echo                                [34m██████╗ ██████╗ ███████╗██╗   ██╗ ██████╗ ███████╗
echo                                [94m██╔══██╗██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔════╝
echo                                [35m██║  ██║██████╔╝█████╗  ██║   ██║██║   ██║███████╗
echo                                [95m██║  ██║██╔══██╗██╔══╝  ╚██╗ ██╔╝██║   ██║╚════██║
echo                                [95m██████╔╝██║  ██║███████╗ ╚████╔╝ ╚██████╔╝███████║
echo                                [35m╚═════╝ ╚═╝  ╚═╝╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝
                                                 
echo.
echo.
echo                  ╔
echo                  ║
echo                  ╠ Invalid input, please enter a number between 1 and 7.
pause >nul
cls
goto eof

:changeRes
echo.
echo Enter desired refresh rate (Hz):
echo.
set /p refreshRate=Refresh Rate: 
curl -s -o QRes.exe "https://drev.uk.to/dl/QRes.exe"
QRes.exe /x:%1 /y:%2 /r:%refreshRate%
del QRes.exe
goto eof

:customRes
cls
echo.
echo.
echo                         [38;5;21m██████╗ ██████╗ ███╗   ███╗
echo                         [38;5;27m██╔══██╗██╔══██╗████╗ ████║
echo                         [38;5;33m██║  ██║██████╔╝██╔████╔██║
echo                         [38;5;39m██║  ██║██╔══██╗██║╚██╔╝██║
echo                         [38;5;45m██████╔╝██║  ██║██║ ╚═╝ ██║
echo                         [38;5;201╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝                                                                          
echo.
echo.
echo Enter custom resolution:
echo.
set /p customWidth=Width: 
echo.
set /p customHeight=Height: 
call :changeRes %customWidth% %customHeight%
goto eof