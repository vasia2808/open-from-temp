set startupDirectory=%~dp0.
set startupFile=%~dpnx0
set startupFileName=%~nx0

set programName=%~n0
set args=%*

set controller=%startupDirectory%\Controller\controller.cmd
call "%controller%"

pause