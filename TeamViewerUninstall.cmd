:: A simple script to remove TeamViewer silently.
:: 
:: Created by Michael Free 2023 
@echo off
setlocal

:: Get the directory where this script is located
set "SCRIPT_PATH=%~dp0"

:: Set the logfile location.
set "LOGFILE=%SCRIPT_PATH%TeamViewerUninstall.log"

:: Set the location of TeamViewer Uninstall
set "TEAMVIEWER_REMOVE=C:\Program Files (x86)\Teamviewer\uninstall.exe"

:: Get the hostname of the computer this is running on
set "HOSTNAME=%COMPUTERNAME%"

:: Get the current timestamp
set "CURRENT_DATE=%DATE%"
set "CURRENT_TIME=%TIME%"
set "CURRENT_DATE_TIME=%CURRENT_DATE: =%%CURRENT_TIME: =%"

:: Test to see if TEAMVIEWER_REMOVE exists.
if exist "%TEAMVIEWER_REMOVE%" (
    :: TeamViewer uninstall exists, run it.
    start /wait "" "%TEAMVIEWER_REMOVE%" /S
    :: Log it's uninstallation
    echo %HOSTNAME%, %CURRENT_DATE_TIME%, UNINSTALLED >> %LOGFILE%
    exit 0

) else (
    :: Log that TeamViewer uninstall file does not exist.
    echo %HOSTNAME%, %CURRENT_DATE_TIME%, NOT INSTALLED >> %LOGFILE%
    exit 0
)

endlocal
