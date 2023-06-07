Get script directory where script is being ran.
• Get the current time stamp when the script is being ran.
• Test to see if logfile exists, if not, create it in scriptdir\TeamViewerRemoval.log
• Test to see if this path exists: C:\Program Files (x86)\TeamViewer\uninstall.exe
• if the path doesn't exist, log the timestamp, the hostname, and the path of the file that doesn't exist.
∘ exit the script
• If it does exist, run the uninstall.exe /S and wait for it to exit.
∘ Once it's done, log the timestamp, the hostname, and state "Uninstalled" to the logfile
• 
