@echo off
call setEnv.bat || goto :error
cd %buildDir% || goto :error
echo on
REM ninja check-lldb-unit

:error
exit /b %errorlevel%
cd %originalDir%
