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
set "TEAMVIEWER_REMOVE0=C:\Program Files (x86)\Teamviewer\uninstall.exe"

:: Alternate Location of TeamViewer Uninstall
set "TEAMVIEWER_REMOVE1=C:\Program Files\Teamviewer\uninstall.exe"


:: Get the hostname of the computer this is running on
set "HOSTNAME=%COMPUTERNAME%"

:: Get the current timestamp
set "CURRENT_DATE=%DATE%"
set "CURRENT_TIME=%TIME%"
set "CURRENT_DATE_TIME=%CURRENT_DATE: =%%CURRENT_TIME: =%"

:: Test to see if TEAMVIEWER_REMOVE0 exists.
if exist "%TEAMVIEWER_REMOVE0%" (
    :: TeamViewer uninstall exists, run it.
    start /wait "" "%TEAMVIEWER_REMOVE0%" /S
    :: Log it's uninstallation
    echo %HOSTNAME%, %CURRENT_DATE_TIME%, UNINSTALLED >> %LOGFILE%
    exit
) else (
    :: Log that TeamViewer uninstall file does not exist.
    echo %HOSTNAME%, %CURRENT_DATE_TIME%, NOTINSTALLED %TEAMVIEWER_REMOVE0% >> %LOGFILE%
    if exists "%TEAMVIEWER_REMOVE1%" (
        :: TeamViewer alternate uninstall exists, run it
        start /wait "" "%TEAMVIEWER_REMOVE1%" /S
        echo %HOSTNAME%, %CURRENT_DATE_TIME%, UNINSTALLED >> %LOGFILE%
        exit
    ) else (
        :: TeamViewer alternate install location not found, log it.
        echo %HOSTNAME%, %CURRENT_DATE_TIME%, NOTINSTALLED %TEAMVIEWER_REMOVE1% >> %LOGFILE%
        exit
    )
)
endlocal
