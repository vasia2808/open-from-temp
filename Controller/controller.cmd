set init=%~dp0init.cmd
call "%init%"

for %%f in (%args%) do (
	if exist %%f (
		for %%i in ("%%~dpnxf") do (
			set file=%%~i
		)
		
		for %%i in ("%%~nxf") do (
			set fileName=%%~i
		)
	)
	
	for /f %%o in (%callOrder%) do (
		call "%~dp0Utils\%%~o"
	)
)