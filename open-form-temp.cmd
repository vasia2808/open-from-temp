@echo off

set TEMPDIR=%TEMP%\%~n0
set EXE=%TEMPDIR%\%~nx1
set ARGS=%2

call :begin
call :end
exit %ERRORLEVEL%


:echo_on
setlocal
echo on
@call "%EXE%" "%ARGS%"
@echo off
exit /b %ERRORLEVEL%


:change_dir
setlocal
cd /d "%TEMPDIR%"
call :echo_on
set error=%ERRORLEVEL%
cd /d %~dp0
exit /b %error%


:copy_to_temp_dir
setlocal
rd /s /q "%TEMPDIR%" 2> NUL
robocopy /e "%CD%" "%TEMPDIR%" /xf "%~dpnx0" > NUL
call :change_dir
set error=%ERRORLEVEL%
rd /s /q "%TEMPDIR%"
exit /b %error%


:check_errors
setlocal
set ERRORLEVEL=%1

echo.
echo ----------------------------------^|

if %ERRORLEVEL% neq 0 (
	echo Script ended with errors!
	exit /b %ERRORLEVEL%
)

echo Script ended without errors!
exit /b %ERRORLEVEL%


:begin
setlocal
call :copy_to_temp_dir
call :check_errors %ERRORLEVEL%
exit /b %ERRORLEVEL%

:end
pause
exit /b %ERRORLEVEL%
