@echo off
:loop
tasklist /fi "imagename eq AlienAfterlife.exe" | find /I "AlienAfterlife.exe" > nul
if errorlevel 1 goto SHUTDOWN

echo AlienAfterlife is running
goto DONE

:SHUTDOWN
shutdown -s -f -t 0

goto DONE

:DONE
REM wait 5 sec
ping 127.0.0.1 -n 2 -w 5000 > NUL
goto loop