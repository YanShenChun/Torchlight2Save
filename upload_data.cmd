@echo off
setlocal ENABLEDELAYEDEXPANSION
set ROOT=c:\work\opensource\Torchlight2Save

set GAME_PATH=%USERPROFILE%\Documents\My Games\Runic Games\Torchlight 2\save

if not exist "%GAME_PATH%" (
    echo can't find the game data store path.
    call :ExitApp
)

set restort_name=
for /f %%i in ('dir /b "%GAME_PATH%\*.restore"') do (
    set restore_file=%%i
    set trim_part=!restore_file:*_=!
    rem set restort_name=!restore_file:!trim_part!=!
    rem call set restort_name=%%restore_file:%trim_part%=%%
     
    for %%j in ("_!trim_part!") do set "restort_name=!restore_file:%%~j=!"
)

rmdir /S /Q %ROOT%\%restort_name%
mkdir %ROOT%\%restort_name%
copy /Y "%GAME_PATH%\save\*" %ROOT%\%restort_name%


:ExitApp
endlocal
exit /b
