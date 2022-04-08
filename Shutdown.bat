@echo off
:loop
tasklist /fi "imagename eq FuzzDungeonGDC.exe" | find /I "FuzzDungeonGDC.exe" > nul
if errorlevel 1 goto SHUTDOWN

echo FD is running
goto DONE

:SHUTDOWN
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
shutdown -s -f -t 0



goto DONE

:DONE
REM wait 5 sec
ping 127.0.0.1 -n 2 -w 5000 > NUL
goto loop