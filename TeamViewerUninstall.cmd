:: A simple script to remove TeamViewer from our Staff Domain.
:: Created by Michael Free 2023 

:: Get the directory where this script is located

:: Get the current timestamp

:: Set the logfile location.

:: Test to see if C:\Program Files (x86)\Teamviewer\uninstall.exe exists

:: If it doesn't exist, log this to a file. Including the Hostname, Timestamp, and "TV Not Found" and exit the script

:: if it does exist, run uninstall.exe /S and wait for it to exit.  Then log it to the file.
:: :: Display a message Please Reboot your computer

